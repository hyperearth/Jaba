call vcvarsall.bat x64
call vcvars64.bat
set LWJGL_3=org/lwjgl/lwjgl
set OUT_DIR=out/production/Jaba
set JAVACPP=org/bytedeco/javacpp
call java -jar javacpp.jar -cp .;                                                                                                                           VKWrap/VkDeviceCreateInfoWrap.java -header -nocompile -d %OUT_DIR%/VKWrap
call java -jar javacpp.jar -cp .;%OUT_DIR%/VKWrap/VkDeviceCreateInfoWrap.class                                                                              VKWrap/JabaClass.java              -header -nocompile -d %OUT_DIR%/VKWrap
call javac                 -cp .;%LWJGL_3%/lwjgl.jar;%LWJGL_3%/lwjgl-vulkan.jar;%JAVACPP%/javacpp.jar;%OUT_DIR%/VKWrap/VKWrap.class;                        Jaba.java                                             -d %OUT_DIR%
call java                  -cp .;%LWJGL_3%/lwjgl.jar;%LWJGL_3%/lwjgl-vulkan.jar;%JAVACPP%/javacpp.jar;%OUT_DIR%/VKWrap/JabaClass.class;%OUT_DIR%/Jaba.class Jaba       
pause
