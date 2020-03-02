call vcvarsall.bat x64
call vcvars64.bat
call java -jar javacpp.jar -cp .;                                                                                               VKWrap/VkDeviceCreateInfoWrap.java  -header -d out/production/Jaba/VKWrap
call java -jar javacpp.jar -cp .;out/production/VKWrap/VkDeviceCreateInfoWrap.class                                             VKWrap/JabaClass.java               -header -d out/production/Jaba/VKWrap
call javac                 -cp .;out/production/VKWrap/VKWrap.class;org/lwjgl/lwjgl/lwjgl.jar;org/lwjgl/lwjgl/lwjgl-vulkan.jar;org/bytedeco/javacpp/javacpp.jar  Jaba.java  -d out/production/Jaba
::call cd out/production
::call java                  -cp .;org/lwjgl/lwjgl/lwjgl.jar;org/lwjgl/lwjgl/lwjgl-vulkan.jar;org/bytedeco/javacpp/javacpp.jar;out/production/Jaba/Jaba.class  Jaba       
::call java -jar javacpp.jar   Jaba.java -exec :: INCOMPATIBLE WITH LWJGL!!!
pause
