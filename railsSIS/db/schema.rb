# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_12_182452) do

  create_table "SIS_assignment", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "outof", null: false
    t.decimal "weight", precision: 5, scale: 2, null: false
    t.string "title", limit: 50, null: false
    t.string "category", limit: 20, null: false
    t.integer "course_id", null: false
    t.index ["course_id"], name: "SIS_assignment_course_id_17c5ca07_fk"
  end

  create_table "SIS_attendance", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.date "date", null: false
    t.string "attendance", limit: 1, null: false
    t.integer "course_id", null: false
    t.integer "student_id", null: false
    t.index ["course_id"], name: "SIS_attendance_course_id_c18593b6_fk"
    t.index ["student_id"], name: "SIS_attendance_student_id_da61073f_fk_SIS_student_id"
  end

  create_table "SIS_courses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "title", limit: 30, null: false
    t.decimal "credit", precision: 3, scale: 2, null: false
    t.text "description", limit: 4294967295, null: false
    t.text "students", limit: 4294967295, null: false
    t.string "teacher_id", limit: 20, null: false
    t.string "code", limit: 30, null: false
    t.index ["teacher_id"], name: "SIS_courses_teacher_id_12187818_fk_SIS_teacher_id"
  end

  create_table "SIS_locker", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "location", limit: 50, null: false
    t.boolean "active", null: false
    t.string "combination", limit: 20, null: false
  end

  create_table "SIS_marks", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "mark", null: false
    t.integer "assignment_id", null: false
    t.integer "student_id", null: false
    t.index ["assignment_id"], name: "SIS_marks_assignment_id_3d7b0b0c_fk_SIS_assignment_id"
    t.index ["student_id"], name: "SIS_marks_student_id_3b62c559_fk_SIS_student_id"
  end

  create_table "SIS_permissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.text "permissions_list", limit: 4294967295, null: false
  end

  create_table "SIS_student", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "surname", limit: 100, null: false
    t.integer "grade", null: false
    t.integer "locker_id", null: false
    t.index ["locker_id"], name: "SIS_student_locker_id_840af384_fk_SIS_locker_id"
  end

  create_table "SIS_teacher", id: :string, limit: 20, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "surname", limit: 100, null: false
    t.string "department", limit: 50, null: false
  end

  create_table "SIS_user", primary_key: "user_id", id: :string, limit: 20, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "user_pw", limit: 50, null: false
    t.string "user_type", limit: 1, null: false
    t.text "user_permissions", limit: 4294967295, null: false
  end

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.string "record_id", limit: 20
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "address", primary_key: "contact_id", id: :string, limit: 11, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "street", limit: 256
    t.string "city", limit: 50
    t.string "province", limit: 50
    t.string "postalcode", limit: 11
    t.string "country", limit: 2
    t.string "phone", limit: 25
    t.string "business_phone", limit: 25
    t.string "fax", limit: 25
    t.string "a_email", limit: 64
    t.string "a_cell", limit: 25
    t.string "a_occupation", limit: 36
    t.string "last_edit", limit: 16
    t.string "access_rights", limit: 1
    t.index ["country"], name: "FK_address"
  end

  create_table "ag_int_counter", primary_key: "agent_blank", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "year"
    t.integer "counter", unsigned: true
  end

  create_table "agencies", primary_key: "agency_code", id: :string, limit: 10, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "agency_name", limit: 128
    t.string "type", limit: 32
    t.integer "contact", limit: 3, null: false, unsigned: true, auto_increment: true
    t.string "contract", limit: 256
    t.string "email", limit: 64
    t.string "website", limit: 256
    t.string "fname", limit: 32
    t.string "lname", limit: 32
    t.string "title", limit: 4
    t.string "position", limit: 64
    t.date "expiry"
    t.string "contract_handler", limit: 64
    t.string "granted", limit: 5
    t.string "generation", limit: 64
    t.string "status", limit: 10
    t.string "note", limit: 256
    t.string "submitted_by", limit: 64
    t.timestamp "last_modified", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "year_established", limit: 2, unsigned: true
    t.integer "num_staff", limit: 3, unsigned: true
    t.string "service", limit: 256
    t.float "service_fee", limit: 53, unsigned: true
    t.string "num_overseas", limit: 8
    t.string "num_canada", limit: 8
    t.integer "esl_overall", limit: 1, unsigned: true
    t.integer "highschool_overall", limit: 1, unsigned: true
    t.integer "university_overall", limit: 1, unsigned: true
    t.integer "summercamp_overall", limit: 1, unsigned: true
    t.integer "other_overall", limit: 1, unsigned: true
    t.integer "esl_can", limit: 1, unsigned: true
    t.integer "highschool_can", limit: 1, unsigned: true
    t.integer "university_can", limit: 1, unsigned: true
    t.integer "summercamp_can", limit: 1, unsigned: true
    t.integer "other_can", limit: 1, unsigned: true
    t.string "hearaboutus", limit: 10
    t.string "schools_can", limit: 256
    t.string "country_operate1", limit: 2
    t.integer "num_of_locations1", limit: 3, unsigned: true
    t.string "country_operate2", limit: 2
    t.integer "num_of_locations2", limit: 3, unsigned: true
    t.string "country_operate3", limit: 2
    t.integer "num_of_locations3", limit: 3, unsigned: true
    t.string "country_operate4", limit: 2
    t.integer "num_of_locations4", limit: 3, unsigned: true
    t.string "country_operate5", limit: 2
    t.integer "num_of_locations5", limit: 3, unsigned: true
    t.string "contract_status", limit: 1
    t.integer "first_year_hs", limit: 3
    t.integer "first_year_camp", limit: 3
    t.integer "second_year_hs", limit: 3
    t.integer "second_year_camp", limit: 3
    t.integer "third_year_hs", limit: 3
    t.integer "third_year_camp", limit: 3
    t.string "country_recruit", limit: 64
    t.index ["contact"], name: "FK_agencies"
  end

  create_table "agents", primary_key: "user_id", id: :string, limit: 18, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "agency", limit: 6
    t.string "position", limit: 32
    t.string "status", limit: 32
    t.index ["agency"], name: "FK_agents"
  end

  create_table "anecdotal_notes", primary_key: "student_id", id: :string, limit: 16, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "commenter_id", limit: 16
    t.string "note", limit: 2048
    t.date "date"
  end

  create_table "assessments", primary_key: ["student_id", "class_num"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_id", limit: 16, default: "", null: false
    t.integer "class_num", limit: 3, default: 0, null: false, unsigned: true
    t.integer "component_no", limit: 1, unsigned: true
    t.string "title", limit: 128
    t.string "score", limit: 5
  end

  create_table "assignments", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category", limit: 24
    t.string "label", limit: 24
    t.integer "class"
    t.boolean "weight"
    t.string "marks", limit: 100
    t.boolean "outOf"
    t.date "day"
  end

  create_table "assignments_notes", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_id", limit: 18, null: false
    t.integer "assignment_id", null: false
    t.string "note", limit: 36
    t.integer "class_id"
    t.index ["assignment_id"], name: "assignment_id"
    t.index ["id"], name: "id", unique: true
    t.index ["student_id"], name: "student_id"
  end

  create_table "attendance", primary_key: ["student_id", "class_num"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_id", limit: 16, default: "", null: false
    t.integer "class_num", limit: 3, default: 0, null: false, unsigned: true
    t.date "date"
    t.string "attendance", limit: 1
  end

  create_table "auth_group", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "auth_group_permissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["permission_id"], name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm"
  end

  create_table "auth_permission", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
  end

  create_table "auth_user", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.datetime "last_login", precision: 6
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 30, null: false
    t.string "last_name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.datetime "date_joined", precision: 6, null: false
    t.index ["username"], name: "username", unique: true
  end

  create_table "auth_user_groups", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_group_id_97559544_fk_auth_group_id"
    t.index ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_94350c0c_uniq", unique: true
  end

  create_table "auth_user_user_permissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm"
    t.index ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq", unique: true
  end

  create_table "book_detail", primary_key: "item_no", id: :integer, limit: 3, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "subject_code", limit: 4
    t.string "publisher", limit: 64
    t.string "title", limit: 64
  end

  create_table "caf_dishes", primary_key: "Id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Name", null: false
    t.string "Description", null: false
    t.string "Type", limit: 10, null: false
    t.string "ImageRef", limit: 500
    t.string "Tag", limit: 10
    t.string "ForMeal", limit: 15, null: false
    t.string "AllTimeCount", limit: 4
    t.string "DaysOffered", limit: 4
  end

  create_table "caf_menu", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "MenuDate", null: false
    t.integer "Id", null: false
    t.string "MealType", null: false
    t.integer "Position", null: false
    t.integer "RepeatGroup"
    t.integer "ServeCount", default: 0, null: false
    t.index ["MenuDate", "Id", "MealType"], name: "UniqueDish", unique: true
    t.index ["MenuDate", "MealType", "Position"], name: "UniquePosition", unique: true
  end

  create_table "caf_repeat", primary_key: "RepeatGroup", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT", force: :cascade do |t|
    t.date "StartDate", null: false
    t.date "EndDate", null: false
    t.string "Pattern", limit: 50, null: false
    t.integer "Position", null: false
    t.integer "DishId", null: false
    t.string "MealType", limit: 50
  end

  create_table "caf_student_cards", primary_key: "user_id", id: :string, limit: 18, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "family_number", limit: 2, null: false
    t.integer "card_number", limit: 2, null: false
    t.string "meal_status", limit: 9, null: false
    t.date "suspension_start_date"
    t.date "suspension_end_date"
    t.string "meal_plan_type", limit: 5
    t.integer "balance"
  end

  create_table "caf_vote", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "MenuDate", null: false
    t.integer "Id", null: false
    t.string "MealType", null: false
    t.string "user_id", limit: 18, null: false
    t.string "voteType", null: false
    t.index ["MenuDate", "Id", "MealType", "user_id", "voteType"], name: "unique", unique: true
  end

  create_table "camp_date", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "session", limit: 20, null: false
    t.date "date", null: false
    t.index ["session"], name: "session", unique: true
  end

  create_table "camp_services", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "question", null: false
    t.text "name"
    t.string "phone", limit: 100
    t.string "email", limit: 200
    t.text "location"
    t.string "remark", limit: 100, null: false
    t.text "answer"
    t.integer "floor"
  end

  create_table "camps", primary_key: "COUNTER", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "s_surname", limit: 32
    t.string "s_first", limit: 128
    t.string "s_other", limit: 50
    t.string "handled_by", limit: 100
    t.binary "photo"
    t.date "date_of_birth"
    t.string "first_lang", limit: 16
    t.string "sex", limit: 1
    t.string "citizenship", limit: 2
    t.string "birth_country", limit: 2
    t.string "email", limit: 128
    t.string "cell", limit: 18
    t.string "status", limit: 2
    t.string "g_title", limit: 4
    t.string "g_surname", limit: 35
    t.string "g_firstname", limit: 128
    t.string "g_email", limit: 128
    t.string "g_cell", limit: 18
    t.string "g_relation", limit: 12
    t.string "e_title", limit: 4
    t.string "e_surname", limit: 35
    t.string "e_firstname", limit: 128
    t.string "e_email", limit: 128
    t.string "e_cell", limit: 18
    t.string "e_relation", limit: 12
    t.string "applying", limit: 30
    t.string "duration", limit: 32
    t.string "session", limit: 16
    t.date "arrive"
    t.string "agency", limit: 64
    t.string "camp_id", limit: 16
    t.string "year", limit: 16
    t.string "old_status", limit: 2
    t.timestamp "date_modified", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "f_surname", limit: 64
    t.string "f_firstname", limit: 64
    t.string "m_surname", limit: 64
    t.string "m_firstname", limit: 64
    t.string "send_documents", limit: 1, default: "0", null: false
    t.string "current_school", limit: 128
    t.date "f_date_of_birth"
    t.date "m_date_of_birth"
    t.date "depart"
  end

  create_table "charges", primary_key: ["student_id", "date"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_id", limit: 16, null: false
    t.datetime "date", null: false
    t.decimal "initial_amount", precision: 10, scale: 2
    t.decimal "current_amount", precision: 10, scale: 2
    t.string "description", limit: 128
  end

  create_table "classes", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "section", limit: 1
    t.string "semester", limit: 2
    t.integer "year"
    t.string "teacher_id", limit: 18
    t.string "label", limit: 24
    t.string "symbol", limit: 16
    t.string "code", limit: 6
    t.string "students", limit: 506
    t.boolean "period"
    t.string "assignments", limit: 500
    t.string "categories"
    t.string "catWeights"
    t.string "room_num", limit: 5
    t.binary "active", limit: 1
    t.string "finalGrades"
  end

  create_table "computer_detail", primary_key: "item_no", id: :integer, limit: 3, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "computer_type", limit: 1
    t.string "cpu", limit: 64
    t.integer "ram", limit: 1, unsigned: true
    t.string "os", limit: 64
    t.string "mac_address", limit: 12
    t.string "ms_office", limit: 64
    t.string "antivirus", limit: 64
    t.string "ip_no", limit: 64
    t.string "keyboard", limit: 64
    t.string "mouse", limit: 64
    t.string "monitor", limit: 64
    t.string "computer_name", limit: 64
  end

  create_table "contact_names", primary_key: "entry_id", id: :integer, limit: 3, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "courtesy_title", limit: 4
    t.string "surname", limit: 32
    t.string "name", limit: 128
    t.integer "contact", limit: 3, unsigned: true
    t.string "owner", limit: 16
    t.string "remark", limit: 256
    t.string "relation", limit: 20
    t.date "birth_date"
    t.index ["contact"], name: "FK_contact_names"
  end

  create_table "contract_requests", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "agency_code", limit: 10, null: false
    t.string "type", limit: 32
    t.timestamp "last_modified"
    t.string "requested_by", limit: 64, null: false
    t.string "note", limit: 256
    t.string "app_fee", limit: 20
  end

  create_table "correspondence", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "po_id"
    t.string "type", limit: 250
    t.string "date", limit: 250
    t.string "infor", limit: 1500
    t.string "entered_by", limit: 250
    t.index ["po_id"], name: "NewIndex1"
  end

  create_table "countries", primary_key: "code", id: :string, limit: 2, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "official_name", limit: 80, null: false
    t.string "common_name", limit: 80, null: false
    t.string "iso3_code", limit: 3
    t.integer "numcode", limit: 2
    t.integer "phone_code", limit: 2, null: false
  end

  create_table "course_codes", primary_key: "code", id: :string, limit: 8, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 64
    t.string "description", limit: 1024
    t.string "grade", limit: 64
    t.float "fee", limit: 53, default: 0.0, null: false
    t.string "prerequisite", limit: 64
    t.string "teacher", limit: 128
    t.float "credit", limit: 53, default: 0.0, null: false
    t.string "course_type", limit: 64
    t.string "delivery", limit: 64
  end

  create_table "course_plans", primary_key: ["code", "semester", "year"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", limit: 8, default: "", null: false
    t.string "semester", limit: 1, default: "W", null: false
    t.integer "year", default: 0, null: false
    t.string "created_by", limit: 16
    t.string "status", limit: 1
  end

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "teacher"
    t.float "credits"
    t.string "students"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "currency_code", limit: 3
  end

  create_table "django_admin_log", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.datetime "action_time", precision: 6, null: false
    t.text "object_id", limit: 4294967295
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false, unsigned: true
    t.text "change_message", limit: 4294967295, null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6_fk_auth_user_id"
  end

  create_table "django_content_type", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "app", null: false
    t.string "name", null: false
    t.datetime "applied", precision: 6, null: false
  end

  create_table "django_session", primary_key: "session_key", id: :string, limit: 40, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.text "session_data", limit: 4294967295, null: false
    t.datetime "expire_date", precision: 6, null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
  end

  create_table "doc_links", primary_key: "counter", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "u_id", limit: 18
    t.string "link", limit: 256
    t.string "doc_id", limit: 256
    t.string "remark", limit: 256
    t.integer "ver"
    t.timestamp "time"
    t.string "handledby", limit: 256
    t.string "status", limit: 7
    t.string "note", limit: 256
    t.index ["u_id"], name: "FK_doc_links"
  end

  create_table "evaluation_plan_items", primary_key: ["code", "semester", "year", "component_no"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", limit: 8, default: "", null: false
    t.string "semester", limit: 1, default: "W", null: false
    t.integer "year", default: 0, null: false
    t.integer "component_no", limit: 1, default: 0, null: false, unsigned: true
    t.string "component", limit: 128
    t.integer "weight", limit: 1, unsigned: true
  end

  create_table "evaluations", primary_key: ["student_id", "class_num"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_id", limit: 16, default: "", null: false
    t.integer "class_num", limit: 3, default: 0, null: false, unsigned: true
    t.integer "component_no", limit: 1, unsigned: true
    t.string "score", limit: 5
    t.string "score_format", limit: 1
    t.integer "total", limit: 1, unsigned: true
  end

  create_table "events", id: :integer, limit: 3, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 64
    t.string "user_id", limit: 16
    t.date "start_date"
    t.date "end_date"
    t.date "expiry"
    t.string "repeat_event", limit: 5
  end

  create_table "expense", primary_key: "counter", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date"
    t.string "amount", limit: 6
    t.string "location", limit: 256
    t.string "notes", limit: 256
    t.string "proof", limit: 256
    t.string "status", limit: 1
    t.string "user", limit: 100
    t.string "currency", limit: 3
  end

  create_table "fee_schedule", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "Stud_id"
    t.string "Tuition_type", limit: 250
    t.string "Tuition_Amount", limit: 250
    t.string "Tuition_Comment", limit: 125
    t.string "Resi_type", limit: 250
    t.string "Resi_Amount", limit: 50
    t.string "Resi_Comment", limit: 250
    t.string "Health_Type", limit: 250
    t.string "Health_Amount", limit: 50
    t.string "Health_Comment", limit: 250
    t.string "Annual_Type", limit: 250
    t.string "Annual_Amount", limit: 50
    t.string "Annual_Comment", limit: 250
    t.string "Guardinship_Type", limit: 250
    t.string "Guardinship_Amount", limit: 50
    t.string "Guardinship_Comment", limit: 250
    t.string "ResiLife_Type", limit: 250
    t.string "ResiLife_Amount", limit: 50
    t.string "ResiLife_Comment", limit: 250
    t.string "Application_Type", limit: 250
    t.string "Application_Amount", limit: 50
    t.string "Application_Comment", limit: 250
    t.string "esl_Type", limit: 250
    t.string "esl_Amount", limit: 50
    t.string "esl_Comment", limit: 50
    t.string "Resi_security_Type", limit: 250
    t.string "Resi_security_Amount", limit: 50
    t.string "Resi_security_Comment", limit: 250
    t.string "School_security_Type", limit: 250
    t.string "School_security_Amount", limit: 50
    t.string "School_security_Comment", limit: 250
    t.string "Uniform", limit: 50
    t.string "Uniform_Comments", limit: 250
    t.integer "esl_flag"
    t.integer "courses1", limit: 1
    t.integer "courses2", limit: 1
    t.boolean "One_Sem"
    t.boolean "Trans_Check"
    t.boolean "Lunch_Check"
    t.string "Lunch_Type", limit: 50
    t.string "Lunch_Amount", limit: 50
    t.string "Lunch_Comment", limit: 50
    t.string "ib_Type", limit: 250
    t.string "ib_Amount", limit: 50
    t.string "ib_Comment", limit: 50
  end

  create_table "flight_info", primary_key: "student", id: :string, limit: 16, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "airline", limit: 32
    t.string "flight_number", limit: 20
    t.datetime "arrival_time"
    t.string "pickup", limit: 20
    t.string "person", limit: 56
    t.string "Notes", limit: 256
    t.string "d_airline", limit: 32
    t.string "d_flight_number", limit: 20
    t.datetime "departure_time"
    t.string "dropoff", limit: 20
    t.string "d_person", limit: 56
  end

  create_table "fridges", primary_key: "fridge_id", id: :string, limit: 4, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "remark", limit: 32
  end

  create_table "help_desk", primary_key: "ticket_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 80, null: false
    t.string "user_id", limit: 20, null: false
    t.string "handled_by", limit: 20, default: "unassigned"
    t.datetime "date_submitted", default: "2000-01-01 00:00:00"
    t.datetime "date_resolved", default: "2000-01-01 00:00:00"
    t.string "status", limit: 13, null: false
    t.string "category", limit: 11, null: false
    t.string "priority", limit: 8, null: false
    t.string "description", limit: 400, null: false
    t.string "resolution", limit: 9, null: false
    t.timestamp "date_modified", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "location", limit: 13, null: false
    t.string "room_no", limit: 10
    t.string "ticket_type", limit: 1, null: false
    t.integer "group"
    t.string "item_type", limit: 64
    t.date "complete_by_date"
  end

  create_table "help_desk_users", primary_key: "user_id", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_role", limit: 2
    t.string "category", null: false
  end

  create_table "holiday", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 16
    t.date "holiday_date"
    t.string "remark", limit: 24
  end

  create_table "homework_postings", primary_key: "entry_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "submitted_by", limit: 16
    t.date "entry_date"
    t.date "due_date"
    t.string "code", limit: 8
    t.string "section", limit: 1
    t.string "section2", limit: 1
    t.string "section3", limit: 1
    t.string "section4", limit: 1
    t.string "section5", limit: 1
    t.string "section6", limit: 1
    t.string "entry_title", limit: 128
    t.string "file", limit: 1
    t.string "announcement", limit: 1
    t.timestamp "date_updated", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "status", limit: 1
  end

  create_table "homework_submissions", primary_key: "class_num", id: :integer, limit: 3, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.binary "file"
    t.string "submitted_by", limit: 16
  end

  create_table "hr_attendances", primary_key: "counter", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "user_id", limit: 18, collation: "utf8_general_ci"
    t.string "action", limit: 10
    t.timestamp "date_submit", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "note", limit: 1024
    t.index ["user_id"], name: "fk_rails_d6f81cb84f"
  end

  create_table "hr_histories", primary_key: "counter", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 18
    t.integer "hour_no"
    t.string "submit_by", limit: 18
    t.string "action", limit: 7
    t.timestamp "time", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "note", limit: 1024
  end

  create_table "hr_hours", primary_key: "counter", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 18
    t.string "hour_type", limit: 11, default: "others"
    t.string "compensation", limit: 10, default: "Unpaid"
    t.string "status", limit: 8
    t.timestamp "last_modify", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.timestamp "date_submit", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "note", limit: 1024
    t.float "duration", default: 0.0
    t.boolean "seen", default: true
    t.string "color", limit: 10
    t.string "title", limit: 100
    t.index ["user_id"], name: "user_id"
  end

  create_table "hr_logs", primary_key: "counter", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 18, collation: "utf8_unicode_ci"
    t.string "submit_by", limit: 18, collation: "utf8_unicode_ci"
    t.string "action", limit: 7, collation: "utf8_unicode_ci"
    t.timestamp "time", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "note", limit: 1024, collation: "utf8_unicode_ci"
  end

  create_table "hr_schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "user_id"
    t.string "monday_st"
    t.string "monday_end"
    t.string "tuesday_st"
    t.string "tuesday_end"
    t.string "wednesday_st"
    t.string "wednesday_end"
    t.string "thursday_st"
    t.string "thursday_end"
    t.string "friday_st"
    t.string "friday_end"
    t.string "saturday_st"
    t.string "saturday_end"
    t.string "sunday_st"
    t.string "sunday_end"
    t.date "calendar_start"
    t.date "calendar_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
  end

  create_table "hr_users", primary_key: "user_id", id: :string, limit: 18, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "latest_job", limit: 20
    t.string "gender", limit: 50
    t.string "pref_name", limit: 30
    t.date "date_of_birth"
    t.string "staff_id", limit: 10
    t.string "role", limit: 4
    t.string "lieu_available", limit: 20, default: "0"
    t.string "status", limit: 9, default: "Active"
    t.date "last_day_of_work"
    t.string "termination_category", limit: 128
    t.string "termination_note", limit: 1024
    t.string "subs_report_to_after_term", limit: 128
    t.string "avatar", limit: 1024
    t.string "medical_note", limit: 1028
    t.date "police_check_acquisition"
    t.date "police_check_expiration"
    t.string "color"
  end

  create_table "int_counter", primary_key: "blank", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "year2009", limit: 2, unsigned: true
    t.integer "year2010", limit: 2, unsigned: true
    t.integer "year2011", limit: 2, unsigned: true
    t.integer "year2012", limit: 2, unsigned: true
    t.integer "year2013", limit: 2, unsigned: true
    t.integer "year2014", limit: 2, unsigned: true
    t.integer "year2015", limit: 2, unsigned: true
    t.integer "year2016", limit: 2, unsigned: true
    t.integer "year2017", limit: 2, unsigned: true
    t.integer "year2018", limit: 2, unsigned: true
    t.integer "year2019", limit: 2, unsigned: true
    t.integer "year2020", limit: 2, unsigned: true
  end

  create_table "inventory_item", primary_key: "item_no", id: :integer, limit: 3, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_type", limit: 32
    t.string "serial_no", limit: 64
    t.string "location", limit: 4
    t.string "owner", limit: 16
    t.string "department", limit: 16
    t.string "item_condition", limit: 1
    t.string "description", limit: 256
    t.index ["item_type"], name: "FK_inventory_item"
    t.index ["location"], name: "FK_inventory_item2"
    t.index ["owner"], name: "FK_inventory_item3"
  end

  create_table "item_type", primary_key: "type_name", id: :string, limit: 32, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  end

  create_table "job_info", primary_key: "job_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "user_id", limit: 18, collation: "utf8_general_ci"
    t.date "effective_date"
    t.date "start_date"
    t.date "end_date"
    t.string "employment_type", limit: 50
    t.string "job_title", limit: 50
    t.string "location", limit: 50
    t.string "department", limit: 50
    t.string "manager", limit: 50
    t.string "pay_rate", limit: 60
    t.string "annual_pay_rate", limit: 60
    t.string "hours_per_week", limit: 60
    t.string "days_per_week", limit: 20
    t.string "start_time", limit: 20
    t.string "end_time", limit: 20
    t.string "benefits_eligibility", limit: 40
    t.date "benefits_start_date"
    t.string "time_off_policy", limit: 40
    t.string "active_job", limit: 5, default: "False"
    t.float "vacation_carryover"
  end

  create_table "job_logs", primary_key: "counter", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "action_id", limit: 50, null: false
    t.string "action", limit: 40
    t.string "updated_by", limit: 18, collation: "utf8_unicode_ci"
    t.timestamp "time", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "note", limit: 2048, collation: "utf8_unicode_ci"
  end

  create_table "lockers", primary_key: "locker_id", id: :string, limit: 4, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "remark", limit: 32
  end

  create_table "log", primary_key: "counter", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 18
    t.timestamp "time", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "category", limit: 17
    t.string "action", limit: 2048
    t.string "app", limit: 5
    t.index ["app"], name: "app"
    t.index ["category"], name: "category"
    t.index ["time"], name: "time"
    t.index ["user_id"], name: "user_id"
  end

  create_table "login_data", primary_key: "counter", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "user_id", limit: 16, null: false
    t.timestamp "login_time", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "logout_time", null: false
  end

  create_table "mailboxes", primary_key: "box_id", id: :string, limit: 4, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "remark", limit: 256
  end

  create_table "messages", primary_key: "counter", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "msg_id"
    t.string "user_id", limit: 18
    t.timestamp "arrival_time", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "read_time", null: false
    t.string "title", limit: 1028
    t.string "message", limit: 2048
    t.string "studentId", limit: 16
    t.string "studentName", limit: 1028
    t.string "type", limit: 4
    t.string "ref"
  end

  create_table "new_marks", primary_key: "blank", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student", limit: 16
    t.string "subject", limit: 32
    t.string "mark", limit: 16
    t.string "grade", limit: 16
    t.string "school_system", limit: 32
    t.index ["student"], name: "FK_new_marks"
  end

  create_table "parents", primary_key: "user_id", id: :string, limit: 16, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "profession", limit: 64
    t.string "employer", limit: 64
    t.string "employer_phone", limit: 16
    t.string "employer_fax", limit: 16
    t.string "employer_ext", limit: 10
    t.string "maritial_status", limit: 9
  end

  create_table "payments", primary_key: ["student_id", "date"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_id", limit: 16, default: "", null: false
    t.datetime "date", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.string "description", limit: 128
    t.string "file_link", limit: 256
    t.string "receipt", limit: 256
    t.boolean "is_void", default: false, null: false
  end

  create_table "policies", primary_key: "name", id: :string, limit: 36, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "policy_type", limit: 15, default: "Non-Teaching FT"
    t.integer "sick_days", unsigned: true
    t.string "vacation_days", limit: 5, default: "5"
    t.string "pt_sick_days", limit: 4, default: "1"
  end

  create_table "potential_student", primary_key: "po_id", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "last_name", limit: 50
    t.string "first_name", limit: 50
    t.date "dob"
    t.string "Gender", limit: 50
    t.string "street", limit: 256
    t.string "city", limit: 50
    t.string "province", limit: 50
    t.string "postal_code", limit: 10
    t.string "country", limit: 2
    t.string "Email", limit: 50
    t.string "Phone", limit: 25
    t.string "Cell", limit: 25
    t.string "interested_program", limit: 250
    t.timestamp "visit_date"
    t.integer "contact_id"
    t.string "status", limit: 1
    t.string "handled_by", limit: 50
    t.string "level_interest", limit: 50
    t.string "current_school", limit: 64
    t.string "referral", limit: 64
    t.string "ref_detail", limit: 2048
    t.string "comments"
    t.string "f_last_name", limit: 64
    t.string "f_first_name", limit: 64
    t.string "m_last_name", limit: 64
    t.string "m_first_name", limit: 64
    t.index ["contact_id"], name: "NewIndex1"
  end

  create_table "prof_marks", primary_key: "student", id: :string, limit: 16, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SLEP", limit: 4
    t.string "MPT", limit: 4
    t.string "SPT(BIO)", limit: 4
    t.string "SPT(CHEM)", limit: 4
    t.string "SPT(PHY)", limit: 4
    t.string "CPT", limit: 4
  end

  create_table "recurring_events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 18
    t.string "title", limit: 18
    t.string "hour_type", limit: 10
    t.string "status", limit: 8
    t.date "anchor"
    t.string "note", limit: 1024
    t.integer "frequency", limit: 1, default: 0
    t.string "color", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "end_time"
    t.time "start_time"
    t.date "end_recur"
    t.index ["user_id"], name: "fk_rails_3470aa4285"
  end

  create_table "reference_check", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "agency_code", limit: 10, null: false
    t.string "name", limit: 32, null: false
    t.string "position", limit: 64
    t.string "school", limit: 64
    t.string "email", limit: 64
    t.string "phone", limit: 32
    t.string "website", limit: 64
    t.string "summary_edited_by", limit: 18
    t.timestamp "summary_edited_time"
    t.text "how_long", limit: 16777215
    t.text "quality_students", limit: 16777215
    t.text "problems_processing", limit: 16777215
    t.text "renew_contract", limit: 16777215
    t.text "would_recommend", limit: 16777215
    t.text "additional_comments", limit: 16777215
    t.string "questions_edited_by", limit: 18
    t.timestamp "questions_edited_time"
    t.index ["id"], name: "agency_num_UNIQUE", unique: true
  end

  create_table "res_rooms", primary_key: "room_id", id: :string, limit: 4, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", limit: 6, default: "single"
    t.string "remark", limit: 32
    t.time "lastUpdated"
    t.string "status", limit: 2, null: false
  end

  create_table "res_waiting", primary_key: "user_id", id: :string, limit: 18, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "move_in_date", null: false
    t.date "move_out_date", null: false
    t.string "request", limit: 6, null: false
    t.datetime "date_added", null: false
  end

  create_table "reservations", primary_key: "user_id", id: :string, limit: 18, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "room_id", limit: 4, null: false
    t.date "move_in_date", null: false
    t.date "move_out_date", null: false
    t.datetime "date_added", null: false
    t.string "priority", limit: 9, default: "Incoming", null: false
    t.string "request_type", limit: 10
    t.index ["room_id"], name: "room_id"
  end

  create_table "room_transition", primary_key: "room_number", id: :string, limit: 16, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status", limit: 2
    t.string "cleaned_by", limit: 64
    t.string "maintained_by", limit: 64
    t.string "cleared_by", limit: 64
    t.string "detailed_cleaned_by", limit: 64
    t.date "last_updated"
    t.string "form_note", limit: 128
    t.string "reserved", limit: 4
    t.string "notified", limit: 5, default: "false"
    t.float "phone", limit: 53
    t.float "jacks", limit: 53
    t.float "fridge", limit: 53
    t.float "screen", limit: 53
    t.float "window", limit: 53
    t.float "sink", limit: 53
    t.float "closet", limit: 53
    t.float "lights", limit: 53
    t.float "carpet", limit: 53
    t.float "chair", limit: 53
    t.float "desk", limit: 53
    t.float "shelves", limit: 53
    t.float "wall", limit: 53
    t.float "bed", limit: 53
    t.float "mattress", limit: 53
    t.float "door", limit: 53
    t.float "smoke_detector", limit: 53
    t.float "heat_detector", limit: 53
    t.float "blinds", limit: 53
    t.float "cleanliness", limit: 53
    t.string "inspected_by", limit: 64
    t.date "move_out_date"
    t.string "last_student", limit: 64
  end

  create_table "rooms", primary_key: "code", id: :string, limit: 4, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 16
  end

  create_table "rtf_table", primary_key: ["transaction_type", "user_id", "room_id", "date_complete"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "room_id", limit: 5, null: false
    t.string "transaction_type", limit: 2, null: false
    t.integer "user_id", null: false
    t.datetime "date_request", null: false
    t.datetime "date_complete", null: false
    t.string "surname", limit: 32, null: false
    t.string "name", limit: 128, null: false
    t.string "item", limit: 67
    t.string "fee", limit: 240
    t.string "inspected_by", limit: 16, null: false
    t.string "signature", limit: 256
    t.string "notes", limit: 200
    t.date "complete_by_date"
  end

  create_table "sessions", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "shipping", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "contact_id", limit: 11
    t.string "b_email", limit: 45
    t.string "shipping", limit: 45
    t.string "tracking", limit: 45
  end

  create_table "staff", primary_key: "user_id", id: :string, limit: 18, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "staff_type", limit: 1
    t.binary "photo"
    t.string "Position", limit: 50
    t.string "qualifications", limit: 100
  end

  create_table "statement_items", primary_key: "statement_id", id: :integer, limit: 3, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date"
    t.string "description", limit: 128
    t.decimal "amount", precision: 10, scale: 2
  end

  create_table "statements", primary_key: "statement_id", id: :integer, limit: 3, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_id", limit: 16
    t.date "date"
    t.decimal "total", precision: 10, scale: 2
    t.date "due_date"
  end

  create_table "student_class_registrations", primary_key: ["code", "section", "student_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", limit: 8, default: "", null: false
    t.string "section", limit: 1, default: "", null: false
    t.string "student_id", limit: 16, default: "", null: false
    t.string "status", limit: 1
  end

  create_table "student_info", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "id"
    t.integer "class_id"
    t.string "comments", limit: 2048
    t.string "final_comments", limit: 2048
    t.string "skills"
  end

  create_table "students", primary_key: "user_id", id: :string, limit: 16, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "handled_by", limit: 18
    t.binary "photo"
    t.date "date_of_birth"
    t.integer "age", limit: 1
    t.string "gender", limit: 1
    t.string "first_language", limit: 20
    t.string "citizenship", limit: 2
    t.string "birth_country", limit: 2
    t.string "eligibility", limit: 19
    t.date "passport_expiry_date"
    t.string "last_school", limit: 96
    t.string "school_web", limit: 100
    t.string "school_email", limit: 100
    t.string "education_complete", limit: 64
    t.string "eduComplete_otherValue", limit: 20
    t.date "education_complete_time"
    t.string "dc_complete", limit: 64
    t.date "dc_complete_time"
    t.string "current_level", limit: 64
    t.string "father", limit: 16
    t.string "mother", limit: 16
    t.string "guardian", limit: 16
    t.string "relationship", limit: 16
    t.string "e_relationship"
    t.string "correspondence", limit: 64
    t.string "emergency_contact_person", limit: 16
    t.string "applying_for", limit: 15
    t.boolean "esl"
    t.boolean "ap"
    t.boolean "ib"
    t.string "description_if_other", limit: 128
    t.string "start_semester", limit: 3
    t.string "start_year", limit: 16
    t.integer "eng_score", limit: 1
    t.string "future_plan", limit: 5
    t.string "program", limit: 64
    t.string "specify", limit: 64
    t.string "accomodation_applied_for", limit: 8
    t.string "roommate_requested", limit: 128
    t.string "special_diet", limit: 10
    t.string "diet_other", limit: 20
    t.string "specify_other", limit: 128
    t.string "allergies", limit: 128
    t.string "lead", limit: 2048
    t.string "inform", limit: 2048
    t.string "consent", limit: 1
    t.string "semester_admitted", limit: 1
    t.integer "year_admitted"
    t.string "status", limit: 3
    t.string "oao_ref_no", limit: 1
    t.time "weekday_curfew"
    t.time "weekend_curfew"
    t.string "old_status", limit: 3
    t.string "school_street", limit: 256
    t.string "school_city", limit: 256
    t.string "school_post", limit: 10
    t.string "school_province", limit: 256
    t.string "school_country", limit: 256
    t.string "agency", limit: 256
    t.date "entry_date"
    t.string "OHIP", limit: 128
    t.string "agent_lead", limit: 256
    t.string "leadOther", limit: 20
    t.string "referred_by", limit: 100
    t.string "referral_email", limit: 64
    t.string "referral_Tel", limit: 20
    t.string "overwrite", limit: 5
    t.string "transmissing", limit: 5
    t.date "app_date"
    t.timestamp "last_modified"
    t.boolean "visa_status"
    t.string "app_number", limit: 10
    t.date "visa_date"
    t.boolean "send_documents", default: false, null: false
    t.index ["father"], name: "FK_students2"
    t.index ["guardian"], name: "FK_students3"
    t.index ["mother"], name: "FK_students4"
  end

  create_table "system_users", primary_key: "user_id", id: :string, limit: 18, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "created"
    t.string "courtesy_title", limit: 4
    t.string "surname", limit: 32
    t.string "name", limit: 128
    t.string "preferred_name", limit: 128
    t.integer "contact", limit: 3, null: false, unsigned: true, auto_increment: true
    t.string "type", limit: 2
    t.string "status", limit: 9
    t.date "expiry_date"
    t.string "cell", limit: 25
    t.string "email", limit: 64
    t.string "rights", limit: 1024
    t.string "region", limit: 13
    t.string "user_pw", limit: 16
    t.date "parent_dob"
    t.index ["contact"], name: "FK_system_users"
  end

  create_table "time_plan_items", primary_key: ["code", "semester", "year"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", limit: 8, default: "", null: false
    t.string "semester", limit: 1, default: "W", null: false
    t.integer "year", default: 0, null: false
    t.string "unit_description", limit: 128
    t.integer "hours", limit: 1, unsigned: true
  end

  create_table "total_credits", primary_key: "student_id", id: :string, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "english_credit", null: false
    t.float "french_credit", null: false
    t.float "math_credit", null: false
    t.float "science_credit", null: false
    t.float "can_history_credit", null: false
    t.float "can_geography_credit", null: false
    t.float "art_credit", null: false
    t.float "healthed_credit", null: false
    t.float "civic_credit", null: false
    t.float "career_credit", null: false
    t.float "group1_credit", null: false
    t.float "group2_credit", null: false
    t.float "group3_credit", null: false
    t.float "total_comp_credit"
    t.float "total_elective_credit"
    t.float "total__credit"
    t.decimal "community_hour", precision: 10, null: false
    t.string "osslt", limit: 1, null: false
    t.date "osslt_complete"
    t.date "grad_date"
    t.timestamp "last_modified", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "trainings", primary_key: "training_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.string "user_id", limit: 20, null: false
    t.string "marked_complete", limit: 20
    t.date "date_completed"
    t.boolean "mandatory", default: false
  end

  create_table "utilizations", primary_key: ["user_id", "resource_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "user_id", limit: 16, default: "", null: false
    t.string "resource_id", limit: 256, default: "", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "keys_issued", limit: 1
    t.string "resource_type", limit: 7
    t.string "staff_id", limit: 16
  end

  create_table "vacation_info", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 16, null: false
    t.timestamp "date_submitted", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "address", limit: 256, null: false
    t.string "city", limit: 50, null: false
    t.string "country", limit: 2, null: false
    t.string "parent_name", limit: 128, null: false
    t.string "parent_surname", limit: 32, null: false
    t.string "parent_email", limit: 64, null: false
    t.string "parent_consent", limit: 1, null: false
    t.string "ec_name", limit: 128, null: false
    t.string "ec_surname", limit: 32, null: false
    t.string "ec_phone", limit: 25, null: false
    t.string "ec_email", limit: 64, null: false
    t.string "relationship", limit: 50, null: false
    t.string "academic_approved", limit: 8, null: false
    t.string "hotel_name", limit: 128
    t.string "hotel_num", limit: 50
    t.string "parent_type", limit: 20
  end

  create_table "vehicles", primary_key: "vehicle_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 15, null: false
    t.string "make", limit: 20, null: false
    t.string "model", limit: 20, null: false
    t.string "color", limit: 20
    t.string "licence_plate", limit: 20
  end

  create_table "work_hours", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "user_id", limit: 20
    t.integer "monday_st"
    t.integer "monday_end"
    t.integer "tuesday_st"
    t.integer "tuesday_end"
    t.integer "calendar_start"
    t.integer "calendar_end"
  end

  add_foreign_key "SIS_assignment", "SIS_courses", column: "course_id", name: "SIS_assignment_course_id_17c5ca07_fk"
  add_foreign_key "SIS_attendance", "SIS_courses", column: "course_id", name: "SIS_attendance_course_id_c18593b6_fk"
  add_foreign_key "SIS_attendance", "SIS_student", column: "student_id", name: "SIS_attendance_student_id_da61073f_fk_SIS_student_id"
  add_foreign_key "SIS_courses", "SIS_teacher", column: "teacher_id", name: "SIS_courses_teacher_id_12187818_fk_SIS_teacher_id"
  add_foreign_key "SIS_marks", "SIS_assignment", column: "assignment_id", name: "SIS_marks_assignment_id_3d7b0b0c_fk_SIS_assignment_id"
  add_foreign_key "SIS_marks", "SIS_student", column: "student_id", name: "SIS_marks_student_id_3b62c559_fk_SIS_student_id"
  add_foreign_key "SIS_student", "SIS_locker", column: "locker_id", name: "SIS_student_locker_id_840af384_fk_SIS_locker_id"
  add_foreign_key "agents", "agencies", column: "agency", primary_key: "agency_code", name: "FK_agents", on_update: :cascade, on_delete: :cascade
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_co"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_97559544_fk_auth_group_id"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id"
  add_foreign_key "contact_names", "system_users", column: "contact", primary_key: "contact", name: "FK_contact_names", on_update: :cascade, on_delete: :cascade
  add_foreign_key "course_plans", "course_codes", column: "code", primary_key: "code", name: "FK_course_plans", on_update: :cascade, on_delete: :cascade
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_auth_user_id"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co"
  add_foreign_key "evaluation_plan_items", "course_codes", column: "code", primary_key: "code", name: "FK_evaluation_plan_items", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hr_hours", "system_users", column: "user_id", primary_key: "user_id", name: "hr_hours_ibfk_1"
  add_foreign_key "hr_users", "system_users", column: "user_id", primary_key: "user_id", name: "hr_users_ibfk_1"
  add_foreign_key "inventory_item", "item_type", column: "item_type", primary_key: "type_name", name: "FK_inventory_item", on_update: :cascade, on_delete: :cascade
  add_foreign_key "inventory_item", "rooms", column: "location", primary_key: "code", name: "FK_inventory_item2"
  add_foreign_key "inventory_item", "system_users", column: "owner", primary_key: "user_id", name: "FK_inventory_item3"
  add_foreign_key "new_marks", "students", column: "student", primary_key: "user_id", name: "FK_new_marks", on_update: :cascade, on_delete: :cascade
  add_foreign_key "parents", "system_users", column: "user_id", primary_key: "user_id", name: "FK_parents", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reservations", "res_rooms", column: "room_id", primary_key: "room_id", name: "reservations_ibfk_1"
  add_foreign_key "staff", "system_users", column: "user_id", primary_key: "user_id", name: "FK_staff", on_update: :cascade, on_delete: :cascade
  add_foreign_key "time_plan_items", "course_codes", column: "code", primary_key: "code", name: "FK_time_plan_items", on_update: :cascade, on_delete: :cascade
end
