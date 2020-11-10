datas = [
    {
      name: "Klinik Sikamali",
      current_level: "1",
      level1: "1",
      level2: nil,
      level3: nil,
      level4: nil,
      level5: nil,
      level6: nil,
      path: "1",
      childs: [
        {
          name: "Instalasi Penunjang",
          current_level: "2",
          level1: "1",
          level2: "2",
          level3: nil,
          level4: nil,
          level5: nil,
          level6: nil,
          path: "1,2",
          childs: [
            {
              name: "Ruang Bersalin",
              current_level: "3",
              level1: "1",
              level2: "2",
              level3: "4",
              level4: nil,
              level5: nil,
              level6: nil,
              path: "1,2,4",
            },
  
            {
              name: "Ruang Bedah",
              current_level: "3",
              level1: "1",
              level2: "2",
              level3: "5",
              level4: nil,
              level5: nil,
              level6: nil,
              path: "1,2,5",
            },
  
            {
              name: "Ruang Rontgen",
              current_level: "3",
              level1: "1",
              level2: "2",
              level3: "6",
              level4: nil,
              level5: nil,
              level6: nil,
              path: "1,2,6",
            },
          ]
        },
        {
          name: "Instalasi Pelayanan",
          current_level: "2",
          level1: "1",
          level2: "7",
          level3: nil,
          level4: nil,
          level5: nil,
          level6: nil,
          path: "1,7",
          childs: [
            {
              name: "Poliklinik",
              current_level: "3",
              level1: "1",
              level2: "2",
              level3: "8",
              level4: nil,
              level5: nil,
              level6: nil,
              path: "1,7,8",
            },
  
            {
              name: "Farmasi",
              current_level: "3",
              level1: "1",
              level2: "2",
              level3: "9",
              level4: nil,
              level5: nil,
              level6: nil,
              path: "1,7,9",
            },
          ]
        }
  
      ]
    }
  ]
  
  current_level = 1
  
  datas.each_with_index do |data1,x1|
  
    puts "level #{current_level}" 
    puts data1[:name]
  
    #penambahan data
    # Klinik Sikamali
    add_level1 = Department.create(
      name: data1[:name],
      current_level: data1[:current_level]
    )
  
    #pengisian level dan path
    set_level1 = Department.find(add_level1.id)
    set_level1.level1 = add_level1.id.to_s
    set_level1.path = add_level1.id
    set_level1.save
  
    if data1[:childs].presence
      if data1[:childs].any?
    
        data1[:childs].each_with_index do |data2,x2|
          puts "level #{current_level+1}" 
          puts data2[:name]
    
          #penambahan data
          add_level2 = Department.create(
              name: data2[:name],
              current_level: data2[:current_level]
          )
    
          #pengisian level dan path
          set_level2 = Department.find(add_level2.id)
          set_level2.parent_id = add_level1
          set_level2.level1 = add_level1.id.to_s
          set_level2.path =add_level1.id.to_s + ","+ add_level2.id.to_s
          set_level2.save
    
          if data2[:childs].presence
            if data2[:childs].any?
      
              data2[:childs].each_with_index do |data3,x3|
                puts "level #{current_level+2}" 
                puts data3[:name]

                #penambahan data
                add_level3 = Department.create(
                  name: data3[:name], 
                  current_level: data3[:current_level]
                )

                #pengisian level dan path
                set_level3 = Department.find(add_level3.id)
                set_level3.parent_id = add_level2
                set_level3.level1 = add_level1.id.to_s
                set_level3.level2 = add_level2.id.to_s
                set_level3.path =add_level1.id.to_s + "," + add_level2.id.to_s + "," + add_level3.id.to_s 
                set_level3.save

                if data3[:childs].presence
                  if data3[:childs].any?
        
                    data3[:childs].each_with_index do |data4,x4|
                      puts "level #{current_level+3}" 
                      puts data4[:name]
          
                      #penambahan data
                      add_level4 = Department.create(
                        name: data4[:name], 
                        current_level: data4[:current_level]
                      )
          
                      #pengisian level dan path
                      set_level4 = Department.find(add_level4.id)
                      set_level4.parent_id = add_level3
                      set_level4.level1 = add_level1.id.to_s
                      set_level4.level2 = add_level2.id.to_s
                      set_level4.level3 = add_level3.id.to_s
                      set_level4.path =add_level1.id.to_s + "," + add_level2.id.to_s + "," + add_level3.id.to_s + "," +add_level4.id.to_s
                      set_level4.save

                      if data4[:childs].presence
                        if data4[:childs].any?
          
                          data4[:childs].each_with_index do |data5,x5|
                            puts "level #{current_level+4}" 
                            puts data5[:name]
                
                            #penambahan data
                            add_level5 = Department.create(
                              name: data5[:name], 
                              current_level: data5[:current_level]
                            )
                
                            #pengisian level dan path
                            set_level5 = Department.find(add_level5.id)
                            set_level5.parent_id = add_level4
                            set_level5.level1 = add_level1.id.to_s
                            set_level5.level2 = add_level2.id.to_s
                            set_level5.level3 = add_level3.id.to_s
                            set_level5.level4 = add_level4.id.to_s
                            set_level5.path =add_level1.id.to_s + "," + add_level2.id.to_s + "," + add_level3.id.to_s + "," +add_level4.id.to_s + "," + add_level5.id.to_s
                            set_level5.save
                            
                            if data5[:childs].presence
                              if data5[:childs].any?
            
                                data5[:childs].each_with_index do |data6,x6|
                                  puts "level #{current_level+5}" 
                                  puts data6[:name]
                      
                                  #penambahan data
                                  add_level6 = Department.create(
                                    name: data6[:name], 
                                    current_level: data6[:current_level]
                                  )
                      
                                  #pengisian level dan path
                                  set_level6 = Department.find(add_level6.id)
                                  set_level6.parent_id = add_level5
                                  set_level6.level1 = add_level1.id.to_s
                                  set_level6.level2 = add_level2.id.to_s
                                  set_level6.level3 = add_level3.id.to_s
                                  set_level6.level4 = add_level4.id.to_s
                                  set_level6.level4 = add_level5.id.to_s
                                  set_level6.path =add_level1.id.to_s + "," + add_level2.id.to_s + "," + add_level3.id.to_s + "," +add_level4.id.to_s + "," + add_level5.id.to_s + "," + add_level6.id.to_s
                                  set_level6.save
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
