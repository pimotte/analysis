
import VersoBlog
import AnalysisBook.Home
import AnalysisBook.LiterateModule
import Sec21
import Sec22
import Sec23
import Sec2E
import Sec31
import Sec41
import Sec42
import Sec43
import Sec51
import Sec52
import Sec53
import Sec54

open Verso Genre Blog Site Syntax

open Output Html Template Theme in
def theme : Theme := { Theme.default with
  primaryTemplate := do
    return {{
      <html>
        <head>
          <meta charset="UTF-8"/>
          <title>{{ (← param (α := String) "title") }} " — Verso "</title>
          <link rel="stylesheet" href="/static/style.css"/>
          <script>"window.__versoSiteRoot=\"/analysis/\""</script>
          {{← builtinHeader }}
        </head>
        <body>
          <header>
            <div class="inner-wrap">

            <nav class="top" role="navigation">
              <ol>
                <li><a href="/">"Home"</a></li>
                <li><a href="/docs/">"Documentation"</a></li>
                {{ ← dirLinks (← read).site }}
              </ol>
            </nav>
          </div>
          </header>
          <div class="main" role="main">
            <div class="wrap">
              {{ (← param "content") }}
            </div>
          </div>
        </body>
      </html>
    }}
  }
  |>.override #[] ⟨do return {{<div class="frontpage"><h1>{{← param "title"}}</h1> {{← param "content"}}</div>}}, id⟩



def demoSite : Site := site AnalysisBook.Home /
  static "static" ← "./static_files"
  "sec21" sec21
  "sec22" sec22
  "sec23" sec23
  "sec2e" sec2e
  "sec31" sec31
  "sec41" sec41
  "sec42" sec42
  "sec43" sec43
  "sec51" sec51
  "sec52" sec52
  "sec53" sec53
  "sec54" sec54


def baseUrl := "https://teorth.github.io/analysis/docs/"

def linkTargets : Code.LinkTargets where
  const name := .some <| s!"{baseUrl}find?pattern={name}#doc"
  definition name := .some <| s!"{baseUrl}find?pattern={name}#doc"

def main := blogMain theme demoSite (linkTargets := linkTargets)
