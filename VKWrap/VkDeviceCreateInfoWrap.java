package VKWrap;

import org.bytedeco.javacpp.*;
import org.bytedeco.javacpp.annotation.*;
import java.nio.Buffer;

@Platform(
    include = {"<vulkan/vulkan.hpp>", "VKWrap.h"},
    includepath = {"Include/", "Include/vulkan/"}
)
@Name("VkDeviceCreateInfo")
public class VkDeviceCreateInfoWrap extends Pointer {
    static { Loader.load(); }
    public VkDeviceCreateInfoWrap() { allocate(); }
    private native void allocate();
}
