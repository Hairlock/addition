{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_Addition (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\ysealy\\Projects\\Addition\\.stack-work\\install\\dec5189f\\bin"
libdir     = "C:\\Users\\ysealy\\Projects\\Addition\\.stack-work\\install\\dec5189f\\lib\\x86_64-windows-ghc-8.2.2\\Addition-0.1.0.0-BWUs2Y4dcWk6UooKOcjh0g"
dynlibdir  = "C:\\Users\\ysealy\\Projects\\Addition\\.stack-work\\install\\dec5189f\\lib\\x86_64-windows-ghc-8.2.2"
datadir    = "C:\\Users\\ysealy\\Projects\\Addition\\.stack-work\\install\\dec5189f\\share\\x86_64-windows-ghc-8.2.2\\Addition-0.1.0.0"
libexecdir = "C:\\Users\\ysealy\\Projects\\Addition\\.stack-work\\install\\dec5189f\\libexec\\x86_64-windows-ghc-8.2.2\\Addition-0.1.0.0"
sysconfdir = "C:\\Users\\ysealy\\Projects\\Addition\\.stack-work\\install\\dec5189f\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Addition_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Addition_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Addition_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Addition_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Addition_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Addition_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
