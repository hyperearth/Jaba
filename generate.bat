call vcvarsall.bat x64
call vcvars64.bat
call java -jar javacpp.jar -cp .;                                                                                VKWrap/VkDeviceCreateInfoWrap.java  -header -d out/production
call java -jar javacpp.jar -cp .;VKWrap/VkDeviceCreateInfoWrap.class                                             VKWrap/JabaClass.java               -header -d out/production
call javac                 -cp .;VKWrap/VKWrap.class;org/lwjgl/lwjgl/lwjgl.jar;org/lwjgl/lwjgl/lwjgl-vulkan.jar;org/bytedeco/javacpp/javacpp.jar  Jaba.java  -d out/production
call cd out/production
call java                  -cp .;org/production/VKWrap/VKWrap.class;org/lwjgl/lwjgl/lwjgl.jar;org/lwjgl/lwjgl/lwjgl-vulkan.jar;org/bytedeco/javacpp/javacpp.jar  Jaba       
::call java -jar javacpp.jar   Jaba.java -exec :: INCOMPATIBLE WITH LWJGL!!!
pause
