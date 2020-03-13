//package Jaba;

import org.bytedeco.javacpp.*;
import org.bytedeco.javacpp.annotation.*;
import org.lwjgl.system.NativeResource;
import static org.lwjgl.vulkan.VK11.*;
import static org.lwjgl.vulkan.VK10.*;
import org.lwjgl.vulkan.*;
import java.nio.Buffer;
import java.lang.reflect.Field;
import VKWrap.*;
import java.io.*; 

//@Platform(include={"vulkan/vulkan.hpp","Jaba.h"})
public class Jaba {
    public static void main(String[] args) {
        // Pointer objects allocated in Java get deallocated once they become unreachable,
        // but C++ destructors can still be called in a timely fashion with Pointer.deallocate()
        
        //VkDeviceCreateInfoWrap l = new VkDeviceCreateInfoWrap();
        VkDeviceCreateInfo ldp = VkDeviceCreateInfo.calloc();
        ldp.sType(VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO);
        
        Pointer l = new Pointer() { { address = ldp.address(); capacity = 64; } };
        
        //System.out.print(ldp.address()+"\n");
        
        JabaClass jb = new JabaClass();
        jb.createDevice(ldp.address());
        //jb.createDevice(l);
    }
}
