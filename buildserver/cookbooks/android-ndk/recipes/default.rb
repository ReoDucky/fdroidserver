
ndk_loc = node[:settings][:ndk_loc]

script "setup-android-ndk" do
  timeout 14400
  interpreter "bash"
  user node[:settings][:user]
  cwd "/tmp"
  code "
    wget http://dl.google.com/android/ndk/android-ndk-r8e-linux-x86.tar.bz2
    tar jxvf android-ndk-r8e-linux-x86.tar.bz2
    mv android-ndk-r8e #{ndk_loc}
  "
  not_if do
    File.exists?("#{ndk_loc}")
  end
end

