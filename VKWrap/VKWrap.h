#include <string>
#include <iostream>
#include <vulkan/vulkan.hpp>

class VKWrap { public: 
    static class JabaClass { public:
        void createDevice(const VkDeviceCreateInfo* info) {
            std::cout << info->sType << std::endl;
            std::cout << info->pNext << std::endl;
            std::cout << info->flags << std::endl;
        };
    };
};
