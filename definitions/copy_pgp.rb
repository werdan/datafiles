define :copy_pgp, :targetdir=> "/etc/pgp" do

  log "Looking for pgp certificates '#{params[:name]}'"

  if (params[:name] == "" || params[:name] == nil) 
    abort("Can not load pgp key without name")
  end

  search(:pgp, "id:#{params[:name]}") do |cert|

    echo_to_file "#{params[:targetdir]}/#{params[:name]}.export" do
      content "#{cert['key']}" 
      mode 0644 
    end
    # Expecting only one  key 
    break

  end
end