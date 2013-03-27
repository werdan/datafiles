define :echo_to_file, :content => "", :mode => 0600, :owner => 'root', :group => 'root' do

	file "#{params[:name]}" do
	  owner "#{params[:owner]}"
	  group "#{params[:group]}"
	  mode "#{params[:mode]}"
	  action :create_if_missing
	end

	case node['plafrorm']
	when "debian","ubuntu"
    	echo_command = "echo \"#{params[:content]}\" > #{params[:name]}"
	when "redhat","centos","scientific","fedora","suse","amazon"
    	echo_command = "echo -e \"#{params[:content]}\" > #{params[:name]}"
	else 
		echo_command = "echo \"#{params[:content]}\" > #{params[:name]}"
	end
		
	execute "Create file with given content" do
	  command "#{echo_command}"
	  action :run
	end

end