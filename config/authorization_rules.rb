authorization do
  
  role :administration do
    has_omnipotence
    has_permission_on :authorization_rules, :to => :read
    #Staff Menu Items
    #has_permission_on :staffs,          :to => [:manage, :borang_maklumat_staff]
    has_permission_on :attendances,     :to => [:manage, :approve]
    #appraisals
    #positions
    has_permission_on :leaveforstaffs,  :to => [:manage, :approve1, :approve2]
    #claims
    has_permission_on [:ptbudgets, :ptcourses, :ptschedules, :ptdos],  :to => :manage   #Professional Development
    #status & movement
    #reports
    
    #Asset Menu Items
    has_permission_on :assets,      :to => :manage                              #asset items
    
    #Location Menu Items
    has_permission_on :locations,   :to => :manage                              #location items
    
    #E-Filing Menu Items
    has_permission_on :documents, :to => [:manage, :generate_report]                 #e-filing items
    
    #Student Menu Items
    #has_permission_on :students,        :to => [:manage, :formforstudent, :maklumat_pelatih_intake]
    #has_permission_on [:leaveforstudents],  :to => :manage #
    
    #Exam Menu Items
    has_permission_on :examquestions,   :to => :manage
    
    #Training Menu Items
    has_permission_on :programmes, :to => :manage
    has_permission_on :timetables, :to => :manage
    has_permission_on :weeklytimetables, :to => :manage
    has_permission_on :trainingnotes, :to => :manage
    
    #Library Menu Items
    has_permission_on [:librarytransactions, :books], :to => :manage
    
    #Administration Menu Items
    has_permission_on [:users, :roles, :pages],  :to => :manage #stuff in admin menu
    
    #Equery Menu Items
    has_permission_on :staffsearch2s, :to => :read
    has_permission_on :assetsearches, :to => :read
    has_permission_on :documentsearches, :to => :read
    has_permission_on :studentsearches, :to => :read
    has_permission_on :studentattendancesearches, :to => :read
    has_permission_on :studentdisciplinesearches, :to => :read
    has_permission_on :studentcounselingsearches, :to => :read
    has_permission_on :weeklytimetablesearches, :to => :read
    has_permission_on :curriculumsearches, :to => :read
    has_permission_on :lessonplansearches, :to => :read
    has_permission_on :personalizetimetablesearches, :to => :read
    has_permission_on :examsearches, :to => :read
    has_permission_on :examresultsearches, :to => :read
    has_permission_on :evaluatecoursesearches, :to => :read
    has_permission_on :examanalysissearches, :to => :read
    has_permission_on :booksearches, :to => :read
    has_permission_on :librarytransactionsearches, :to => :read
  end
  
  
  #Group Staff
  
  role :staff do
    has_permission_on :authorization_rules, :to => :read
    has_permission_on [:attendances, :assets, :documents],     :to => :menu              # Access for Menus
    has_permission_on :books, :to => :core
    has_permission_on :ptdos, :to => :create
    has_permission_on :ptdos, :to => :index do
      if_attribute :staff_id => is {Login.current_login.staff_id}
    end
    has_permission_on :staffs, :to => [:show, :menu]
    has_permission_on :staffs, :to => [:edit, :update, :menu] do
      if_attribute :id => is {Login.current_login.staff_id}
    end
    has_permission_on :attendances, :to => [:index, :show, :new, :create, :edit, :update] do
      if_attribute :staff_id => is {Login.current_login.staff_id}
    end
    has_permission_on :attendances, :to => [:index, :show, :approve, :update] do
        if_attribute :approve_id => is {Login.current_login.staff_id}
    end
    
    has_permission_on :staff_appraisals, :to => :create
    has_permission_on :staff_appraisals, :to => :manage, :join_by => :or do 
        if_attribute :staff_id => is {Login.current_login.staff_id}
        if_attribute :eval1_by => is {Login.current_login.staff_id}
        if_attribute :eval2_by => is {Login.current_login.staff_id}
    end
    
    has_permission_on :leaveforstaffs, :to => :create
    has_permission_on :leaveforstaffs, :to => [:index, :show, :edit, :update] do
      if_attribute :staff_id => is {Login.current_login.staff_id}
    end
    has_permission_on :leaveforstaffs, :to => [:index, :show, :approve1, :update] do
        if_attribute :approval1_id => is {Login.current_login.staff_id}
    end
    has_permission_on :leaveforstaffs, :to => [:index, :show, :approve2, :update] do
        if_attribute :approval2_id => is {Login.current_login.staff_id}
    end
    has_permission_on :ptdos, :to => :delete do
        if_attribute :staff_id => is {Login.current_login.staff_id}
    end
    
    has_permission_on [:travel_claims, :travel_claim_allowances, :travel_claim_receipts, :travel_claim_logs], :to => [:index, :show, :create, :update, :claimprint]do 
        if_attribute :staff_id => is {Login.current_login.staff_id}
    end
    
    has_permission_on :asset_defects, :to => :create
    has_permission_on :asset_defects, :to => [:read, :update]  do
        if_attribute :reported_by => is {Login.current_login.staff_id}
    end
    has_permission_on :asset_defects, :to => [:manage]  do
        if_attribute :decision_by => is {Login.current_login.staff_id}
    end
    
    has_permission_on :documents, :to => [:approve,:menu], :join_by => :or do 
        if_attribute :stafffiled_id => is {Login.current_login.staff_id}
        if_attribute :cc1staff_id => is {Login.current_login.staff_id}
        if_attribute :cc2staff_id => is {Login.current_login.staff_id}
    end  
    
    #to works in travel request..28 August 2013
    #has_permission_on :documents, :to => :index 

   
    has_permission_on :student_discipline_cases, :to => :create
    has_permission_on :student_discipline_cases, :to => :approve do
      if_attribute :assigned_to => is {Login.current_login.staff_id}
    end
    has_permission_on :student_discipline_cases, :to => :manage do
      if_attribute :assigned2_to => is {Login.current_login.staff_id}
    end
    has_permission_on :student_discipline_cases, :to => :read, :join_by => :or do
      if_attribute :reported_by => is {Login.current_login.staff_id}
      if_attribute :assigned_to => is {Login.current_login.staff_id}
      if_attribute :assigned2_to => is {Login.current_login.staff_id}
    end

    has_permission_on :librarytransactions, :to => :read do
      if_attribute :staff_id => is {Login.current_login.staff_id}
    end
  end
  
  role :staff_administrator do
     has_permission_on :staffs, :to => [:manage, :borang_maklumat_staff]
     has_permission_on :attendances, :to => :manage
     has_permission_on :staff_attendances, :to => :manage   #29Apr2013-refer routes.rb
     has_permission_on :staffsearch2s, :to => :read
  end
  
  role :finance_unit do
    has_permission_on [:travel_claims, :travel_claim_allowances, :travel_claim_receipts, :travel_claim_logs], :to => [:manage, :check, :approve, :claimprint]
  end
  
  role :training_manager do
    has_permission_on [:ptbudgets, :ptcourses, :ptschedules], :to => :manage
  end
  
  role :training_administration do
    has_permission_on [:ptcourses, :ptschedules], :to => :manage
    has_permission_on :ptdos, :to => :approve
  end
  
  #Group Assets  -------------------------------------------------------------------------------
  role :asset_administrator do
    has_permission_on :assets, :to => :manage
    has_permission_on :asset_defects, :to =>[:manage, :kewpa9] #3nov2013
    has_permission_on :assetsearches, :to => :read
    has_permission_on :locations, :to => [:manage]
  end

  
  #Group Locations  -------------------------------------------------------------------------------
  role :facilities_administrator do
    has_permission_on :locations, :to => [:manage, :indextree]
    has_permission_on :tenants, :to => :manage
    #has_permission_on :leaveforstudents, :to => :manage
  end
  
  role :warden do
    has_permission_on :locations, :to => :core
    has_permission_on :leaveforstudents, :to => :manage
    #has_permission_on :leaveforstudents, :to => [:index,:create, :show, :update, :approve] do
      #if_attribute :studentsubmit => true
    #end
  end
  
  #Group E-Filing ------------------------------------------------------------------------------- 
  role :e_filing do
    has_permission_on :cofiles, :to => :manage
    has_permission_on :documents, :to => [:manage, :generate_report] #do
        #if_attribute :prepared_by => is {Login.current_login.staff_id}
        #if_attribute :stafffiled_id => is {Login.current_login.staff_id}
    #end
    has_permission_on :documentsearches, :to => :read
  end
  
  #Group Student --------------------------------------------------------------------------------
  role :student do
    
      has_permission_on :locations, :to => :menu
      
      has_permission_on :tenants, :to => :read do
        if_attribute :student_id => is {Login.current_login.student_id}
      end
      
      #has_permission_on :student_counseling_sessions, :to => :create
      #has_permission_on :student_counseling_sessions, :to => :show do
        #if_attribute :student_id => is {Login.current_login.student_id}
      #end
    
      has_permission_on :programmes, :to => :menu
      has_permission_on :books, :to => :core
      has_permission_on :students, :to => [:read, :update, :menu] do
        if_attribute :student_id => is {Login.current_login.student_id}
      end
      has_permission_on :leaveforstudents, :to => [:read, :update] do
        if_attribute :student_id => is {Login.current_login.student_id}
      end
      has_permission_on :leaveforstudents, :to => [:create]
  end
  
  role :student_administrator do
     has_permission_on :students, :to => [:manage, :formforstudent, :maklumat_pelatih_intake, :ethnic_listing]
     has_permission_on :studentsearches, :to => :read
  end
  
  role :disciplinary_officer do
    has_permission_on :student_discipline_cases, :to => :manage
    has_permission_on :student_counseling_sessions, :to => :feedback_referrer
    has_permission_on :studentdisciplinesearches, :to => :read    
  end
  
  role :student_counsellor do
    has_permission_on :student_counseling_sessions, :to => [:manage, :feedback_referrer]
    has_permission_on :students, :to => :core
    has_permission_on :studentcounselingsearches, :to => :read
  end
  
  #Group Training  -------------------------------------------------------------------------------

  role :programme_manager do
    has_permission_on :programmes, :to => :manage
    has_permission_on :timetables, :to => :manage#:to => [:index, :show, :edit, :update, :menu, :calendar]
    has_permission_on :topics, :to => :manage
    has_permission_on :weeklytimetables, :to => :manage #21March2013 added
  end
#--21march2013-new role added  
  role :coordinator do
    has_permission_on :programmes, :to => :manage
    has_permission_on :timetables, :to => :manage
    has_permission_on :weeklytimetables, :to => :manage do
      if_attribute :prepared_by => is {Login.current_login.staff_id}
    end
 end
#--21march2013-new role added    
  role :lecturer do
    has_permission_on :examquestions, :to => :manage
    has_permission_on :programmes, :to => [:core,:menu]
    has_permission_on :topics, :to => :manage
    has_permission_on :timetables, :to => [:index, :show, :edit, :update, :menu, :calendar] do
      if_attribute :staff_id => is {Login.current_login.staff_id}
    end
    has_permission_on :trainingreports, :to => :manage, :join_by => :or do
      if_attribute :staff_id => is {Login.current_login.staff_id}
      if_attribute :tpa_id => is {Login.current_login.staff_id}
    end
    has_permission_on :timetables, :to => [:create]
    has_permission_on :students, :to => [:menu, :index]
    has_permission_on :student_attendances, :to => :create
    has_permission_on :student_attendances, :to => :manage do
      if_attribute :weeklytimetable_id => is_in {Login.current_login.classes_taughtby}
    end
    has_permission_on :weeklytimetables, :to => :personalize_index do
      if_attribute :staff_id => is {Login.current_login.staff_id}
    end
    
    #from Ogma
    has_permission_on :trainingnotes, :to => :manage, :join_by => :or do
     if_attribute :topicdetail_id => is_in {Login.current_login.topicdetails_of_programme}
     if_attribute :timetable_id => is_in {Login.current_login.timetables_of_programme} 
    end
    
    has_permission_on :trainingnotes, :to => :manage, :join_by => :and do
      if_attribute :topicdetail_id => is {nil}
      if_attribute :timetable_id => is {nil}
    end
   
    has_permission_on :studentattendancesearches, :to => :read
    has_permission_on :weeklytimetablesearches, :to => :read
    has_permission_on :curriculumsearches, :to => :read
    has_permission_on :lessonplansearches, :to => :read
    has_permission_on :personalizetimetablesearches, :to => :read
    has_permission_on :examsearches, :to => :read
    has_permission_on :examresultsearches, :to => :read
    has_permission_on :evaluatecoursesearches, :to => :read
    has_permission_on :examanalysissearches, :to => :read
  end
  
  
  #Group Exams   -------------------------------------------------------------------------------
  
  #Group Library   -------------------------------------------------------------------------------
  
  role :librarian do
    has_permission_on :books, :to => [:manage, :extend, :return]
    has_permission_on :librarytransactions , :to => [:manage, :extend, :extend2,:return,:return2, :check_availability, :form_try, :multiple_edit,:check_availability2,:multiple_update]#,:accession_list]  
    has_permission_on :students, :to => :index
    has_permission_on :booksearches, :to => :read
    has_permission_on :librarytransactionsearches, :to => :read
  end 
  
  role :guest do
    has_permission_on :users, :to => :create
    has_permission_on :books, :to => :core
  end
  
end
  
  privileges do
    privilege :approve,:includes => [:read, :update]
    privilege :manage, :includes => [:create, :read, :update, :delete, :core, :approve, :menu]
    privilege :menu,   :includes => [:index]
    privilege :read,   :includes => [:index, :show]
    privilege :create, :includes => :new
    privilege :update, :includes => :edit
    privilege :delete, :includes => :destroy
  end