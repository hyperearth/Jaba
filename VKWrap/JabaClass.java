package VKWrap;

import org.bytedeco.javacpp.*;
import org.bytedeco.javacpp.annotation.*;
import org.bytedeco.javacpp.tools.*;
import java.nio.Buffer;
import VKWrap.VkDeviceCreateInfoWrap;

@Platform(
    include = {"<vulkan/vulkan.hpp>", "VKWrap.h"},
    includepath = {"Include/", "Include/vulkan/"}
)
@Name("VKWrap::JabaClass")
public class JabaClass extends Pointer {
    static { Loader.load(); }
    public JabaClass() { allocate(); }
    private native void allocate();
    public native void createDevice(@Cast("const VkDeviceCreateInfo*") @ByRef long info);
}
