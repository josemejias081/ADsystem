class ResetAllNoteCacheCounters < ActiveRecord::Migration[7.0]
  def change
    def up

      Note.all.each do |note|
     
        Note.reset_counters(note.id, :products)
  
      end
      
     
    def down
    
        # no rollback needed
    
    end
     
     end
  end
end
