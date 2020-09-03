class AddAttachmentMp3ToBlogs < ActiveRecord::Migration[6.0]
  def self.up
    change_table :blogs do |t|
      t.attachment :mp3
    end
  end

  def self.down
    remove_attachment :blogs, :mp3
  end
end
