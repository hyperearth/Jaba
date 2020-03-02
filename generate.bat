call vcvarsall.bat x64
call vcvars64.bat
call java -jar javacpp.jar -cp .                                                      VKWrap/VkDeviceCreateInfoWrap.java  -header 
call java -jar javacpp.jar -cp .;VKWrap/VkDeviceCreateInfoWrap.class                  VKWrap/JabaClass.java               -header 
call javac                 -cp .;VKWrap/VKWrap.class;org/lwjgl/lwjgl/lwjgl.jar;org/lwjgl/lwjgl/lwjgl-vulkan.jar;org/bytedeco/javacpp/javacpp.jar  Jaba.java 
call java                  -cp .;VKWrap/VKWrap.class;org/lwjgl/lwjgl/lwjgl.jar;org/lwjgl/lwjgl/lwjgl-vulkan.jar;org/bytedeco/javacpp/javacpp.jar  Jaba
::call java -jar javacpp.jar   Jaba.java -exec :: INCOMPATIBLE WITH LWJGL!!!
pause
