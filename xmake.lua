-- add modes: debug and release
add_rules("mode.debug", "mode.release")

-- add target
-- target("flv")

--     -- set kind
--     set_kind("static")
--     add_includedirs("libflv/include")

--     -- add files
--     add_files("libflv/source/*.c")

-- -- add target
-- target("rtmp")
--     add_defines("_IETF_HAMC_")
--     set_kind("static")
--     add_includedirs("libflv/include","librtmp/include")
--     add_includedirs("/usr/local/opt/openssl@1.1/include")
--     add_includedirs("../sdk/include")
--     -- add files
--     add_files("librtmp/source/*.c")
--     add_files("../sdk/source/digest/sha*.c","../sdk/source/digest/hmac.c")
add_defines("_IETF_HAMC_")

--    -- set language: c99, c++11
set_languages("c99")
target("media_protocol")
    set_kind("shared")
    -- common
    if is_plat("macosx") then
        add_defines("OS_MAC")
        add_includedirs("/usr/local/opt/openssl@1.1/include")
    end
    add_includedirs("../sdk/include")   
    add_files("../sdk/source/digest/sha*.c","../sdk/source/digest/hmac.c") 
    -- add_files("../sdk/source/**.c") 

    --  rtmp 依赖 flv
    add_includedirs("libflv/include","librtmp/include")
    add_files("libflv/source/*.c")
    add_files("librtmp/source/*.c")
    -- libmov
    add_includedirs("libmov/include")
    add_files("libmov/source/*.c")
    -- libmpeg
    add_includedirs("libmpeg/include")
    add_files("libmpeg/source/*.c")

    -- librtp
    add_includedirs("librtp/include")
    add_files("librtp/source/*.c","librtp/payload/*.c")

    -- libhls 依赖 libmov libmpeg
    add_includedirs("libhls/include","libhls/source")
    add_files("../sdk/source/base64.c","../sdk/source/string/strsplit.c","../sdk/source/string/strtrim.c")  -- sdk
    add_files("libhls/source/*.c")


    -- libdash  依赖 libmov libhls
    add_includedirs("libdash/include")
    add_files("libdash/src/*.c")

    -- -- libaio
    -- add_includedirs("../sdk/libaio/include")   
    -- add_files("../sdk/libaio/src/*.c")   
    -- add_files("../sdk/source/twtimer.c")  -- sdk
    -- if is_plat("macosx") then
    --     add_files("../sdk/source/port/aio-socket-kqueue.c")
    -- end
    -- if is_plat("linux") then
    --     add_files("../sdk/source/port/aio-socket-epoll.c")
    -- end
    -- if is_plat("windows") then
    --     add_files("../sdk/source/port/aio-socket-iocp.c")
    -- end
    -- -- libhttp  依赖 libaio
    -- -- mac 下需要修改代码/sdk/libhttp/include/http-client.h 添加 #include <stdint.h>
    -- add_includedirs("../sdk/libhttp/include")   
    -- add_files("../sdk/libhttp/source/*.c")

    -- -- librtsp 依赖 libhttp libaiop
    -- add_includedirs("librtsp/include")
    -- add_files("librtsp/source/*.c")

    -- -- libsip 依赖 libhtt libaiop
    -- add_includedirs("libsip/include")
    -- add_files("libsip/src/*.c")
--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
-- 
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

