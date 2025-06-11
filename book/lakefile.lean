import Lake
open Lake DSL

require verso from git "https://github.com/pimotte/verso.git"@"analysis"

package "analysis-book" where
  version := v!"0.1.0"

lean_lib «AnalysisBook» where
  -- add library configuration options here

@[default_target]
lean_exe "analysis-book" where
  root := `AnalysisBook

def vars :=
  #["LAKE", "LAKE_HOME", "LAKE_PKG_URL_MAP",
    "LEAN_SYSROOT", "LEAN_AR", "LEAN_PATH", "LEAN_SRC_PATH",
    "LEAN_GITHASH",
    "ELAN_TOOLCHAIN", "DYLD_LIBRARY_PATH", "LD_LIBRARY_PATH"]

target leanCode : Unit := do
  discard <| IO.Process.run {
    cmd := "lake",
    cwd := "../analysis",
    args := #["build", "Analysis:literate"],
    env := vars.map (·, none)
  }
  pure (.pure ())

input_file «Analysis.Section_2_epilogue» where
  text := true
  path := "../analysis/.lake/build/literate/Analysis/Section_2_epilogue.json"

lean_lib Sec2E where
  srcDir := "sections"
  needs := #[leanCode, «Analysis.Section_2_epilogue»]

input_file «Analysis.Section_2_1» where
  text := true
  path := "../analysis/.lake/build/literate/Analysis/Section_2_1.json"

lean_lib Sec21 where
  srcDir := "sections"
  needs := #[leanCode, «Analysis.Section_2_1»]

input_file «Analysis.Section_2_2» where
  text := true
  path := "../analysis/.lake/build/literate/Analysis/Section_2_2.json"

lean_lib Sec22 where
  srcDir := "sections"
  needs := #[leanCode, «Analysis.Section_2_2»]

input_file «Analysis.Section_2_3» where
  text := true
  path := "../analysis/.lake/build/literate/Analysis/Section_2_3.json"

lean_lib Sec23 where
  srcDir := "sections"
  needs := #[leanCode, «Analysis.Section_2_3»]

input_file «Analysis.Section_3_1» where
  text := true
  path := "../analysis/.lake/build/literate/Analysis/Section_3_1.json"

lean_lib Sec31 where
  srcDir := "sections"
  needs := #[leanCode, «Analysis.Section_3_1»]

input_file «Analysis.Section_4_1» where
  text := true
  path := "../analysis/.lake/build/literate/Analysis/Section_4_1.json"

lean_lib Sec41 where
  srcDir := "sections"
  needs := #[leanCode, «Analysis.Section_4_1»]

input_file «Analysis.Section_4_2» where
  text := true
  path := "../analysis/.lake/build/literate/Analysis/Section_4_2.json"

lean_lib Sec42 where
  srcDir := "sections"
  needs := #[leanCode, «Analysis.Section_4_2»]

input_file «Analysis.Section_4_3» where
  text := true
  path := "../analysis/.lake/build/literate/Analysis/Section_4_3.json"

lean_lib Sec43 where
  srcDir := "sections"
  needs := #[leanCode, «Analysis.Section_4_3»]
