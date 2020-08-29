class Ability
  include CanCan::Ability

  def initialize(user)

    if user.lr_admin?
      can :manage, :all
      can :access, :rails_admin       
      can :dashboard                  # allow access to dashboard

    # remember to add roles to user.rb
    #
    # http://hibbard.eu/authentication-with-devise-and-cancancan-in-rails-4-2/  
    #

    elsif user.lr_supervisor?

      # if this not  here, then cannot autocomplete machine
      can :manage, :all
      # can :manage,  [ MorningMeeting,   ]
      cannot [ :create, :update, :destroy,  ],  :all

      can :access, :rails_admin      
      can :manage, :dashboard                  # allow access to dashboard
      can :dashboard                  # allow access to dashboard
      can :access, :dashboard                  # allow access to dashboard
      can :show_in_app, :all

      # can :read, :all 
      can :read,  [ MorningMeeting, VwEamAsset,   PapertrailTable, User, Role  ]
      can [ :create, :update, ], [ MorningMeeting,  ]
      # can [ :create, :update, ], [ Product , Pfeature, ProductFeature, CountryOfOrigin  ]
      # can [ :destroy, ], [ PpParkingpass  ]
      can :export,  :all 
      can :history,  :all
      
      
    elsif user.lr_regular?

      # if this not  here, then cannot autocomplete machine
      can :manage, :all
      cannot [ :create, :update, :destroy, :read ],  :all

      can :access, :rails_admin       
      can :manage, :dashboard                  # allow access to dashboard
      can :dashboard                  # allow access to dashboard
      can :access, :dashboard                  # allow access to dashboard

      can :read,  [ ElistReport,  Elist, Report, PapertrailTable, ]
      can [ :create, :update, ], [ ElistReport, Elist ]
      
      #can [ :update, ], [ DcDiscipline, ]
      # can :read, [  Role, User, ]
      # can :read, [  Answer, PartNumber, ProcessStep,  Question, Survey, QuestionList ]
      # can [ :create, :update, ], [  Answer ]
      # can :history,  :index

      cannot :export,  :all 
      can :show_in_app, :all


    elsif user.lr_future4?
      # can :read, [ Product, Role, User]
      # can [ :create, :update, :destroy, ], [ Product, ]

      
    elsif user.lr_readonly?
      can :manage, :all
      cannot [ :create, :update, :destroy, :read ],  :all

      can :manage, :dashboard                  # allow access to dashboard
      can :dashboard                  # allow access to dashboard
      can :access, :rails_admin       
      can :access, :dashboard                  # allow access to dashboard

      can :read, [ Elist, Report, ElistReport, Role ]

      cannot :export,  :all 
      can :show_in_app, :all
      
    elsif user.lr_minimal?
      can :read, Role

    end
    
  end
   
end

