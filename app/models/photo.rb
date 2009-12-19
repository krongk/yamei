class Photo < ActiveRecord::Base
	acts_as_nice_url :id=>true, :title=>'image'
  acts_as_taggable

	validates_format_of :image,   
       :with=>/^.*(.jpg|.JPG|.gif|.GIF|.png|.PNG)$/,   
       :message => "你只能上传JPG或则GIF的图片文件"  

	file_column :image, :magick=>{
		#:crop =>'1:1',
		:versions=>{:medium=>'650x',:thumb=>'200x',:small=>'60x45'}
	}
	validates_presence_of :image 
	#validates_image_size :image, :min => "1200x1800"
end
