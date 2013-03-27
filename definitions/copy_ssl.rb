define :copy_ssl, :targetdir=> "/etc/ssl" do

  log "Looking for SSL certificates '#{params[:name]}'"

  if (params[:name] == "" || params[:name] == nil) 
    abort("Can not load certificate without name")
  end

  search(:ssl, "id:#{params[:name]}") do |cert|

    echo_to_file "#{params[:targetdir]}/#{params[:name]}.key" do
      content "#{cert['key']}" 
      mode 0644 
    end
    echo_to_file "#{params[:targetdir]}/#{params[:name]}.cer" do
      content "#{cert['cer']}" 
      mode 0644 
    end

    # Expecting only one certificate pair
    break

  end
end