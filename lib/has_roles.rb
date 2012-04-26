module HasRoles

  module MetaProgramming

    def has_roles(*roles)
     roles = roles.collect { |role| role.to_s }
     roles.each do |role|

        (class << self; self; end).send(:define_method, "only_#{role.pluralize}") do
          where(["roles_mask & ? > 0", 2**roles.index(role)])
        end 

      end 

      define_method :roles= do |new_roles|
        new_roles = new_roles.collect { |role| role.to_s }
        self.roles_mask = (new_roles & roles).map { |r| 2**roles.index(r) }.sum
      end
    
      define_method :roles do
        roles.reject { |r| ((roles_mask || 0) & 2**roles.index(r)).zero? }
      end
    
      define_method :role? do |role|
        self.roles.include? role.to_s
      end
    
      define_method :roles? do |accepted_roles, verify_admin = true|
        return true if role? :admin
        accepted_roles.each do |role|
          return true if role? :admin
        end
        false
      end

    end

  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.extend HasRoles::MetaProgramming
  end

end
