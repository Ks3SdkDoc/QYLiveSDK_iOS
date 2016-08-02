Pod::Spec.new do |spec|
   spec.name                = "QYLiveSDK_Dynamic"
   spec.summary             = "QYLiveSDK provides  easy apis for you to integrate live feature into your project, just enjoy it!"
   spec.version             = "0.3.1"
   spec.license             = "Copyright 2016 kingsoft Ltd. All rights reserved"
   spec.source              = { :git => "https://github.com/ksvc/QYLiveSDK_iOS.git", :tag => "v0.3.1"}
   spec.homepage            = "https://github.com/"
   spec.author              = { "Noiled" => "zhangjun5@kingsoft.com"  }
   spec.platform            = :ios, '8.0'   
   spec.vendored_frameworks = 'frameworks/dynamic/QYLiveSDK.framework'

   spec.dependency 'AFNetworking', '~> 3.1.0'
   spec.dependency 'SDWebImage',   '~> 3.7.6'
   spec.dependency 'Masonry',      '~> 1.0.0'
   spec.dependency 'MJRefresh',  '~>3.1.0'
   spec.dependency 'pop', '~> 1.0'
   spec.dependency 'FMDB', '~> 2.6.2'
   spec.dependency 'SSZipArchive','1.2'
   
   end
