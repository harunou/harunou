Config { 

   -- appearance
     font =     "xft:xos4 Terminus:pixelsize=14"
   , fgColor =  "#646464"
   , position = Bottom

   -- layout
   , sepChar =  "%"   -- delineator between plugin names and straight text
   , alignSep = "}{"  -- separator between left-right alignment
   , template = " %battery% | %cpu% | %memory% | %dynnetwork% | epo-vpn: <fc=#046162>%epo-vpn%</fc> | %XMonadLog% }{ %EHRD% | %kbd% | %date%"

   -- general behavior
   , lowerOnStart =     True    -- send to bottom of window stack on start
   , hideOnStart =      False   -- start with window unmapped (hidden)
   , allDesktops =      True    -- show on all desktops
   , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
   , pickBroadest =     False   -- choose widest display (multi-monitor)
   , persistent =       False   -- enable/disable hiding (True = disabled)

   -- plugins
   --   Numbers can be automatically colored according to their value. xmobar
   --   decides color based on a three-tier/two-cutoff system, controlled by
   --   command options:
   --     --Low sets the low cutoff
   --     --High sets the high cutoff
   --
   --     --low sets the color below --Low cutoff
   --     --normal sets the color between --Low and --High cutoffs
   --     --High sets the color above --High cutoff
   --
   --   The --template option controls how the plugin is displayed. Text
   --   color can be set by enclosing in <fc></fc> tags. For more details
   --   see http://projects.haskell.org/xmobar/#system-monitor-plugins.
   , commands = [ 

        -- weather monitor
          Run Weather "EHRD" [ "--template", "<skyCondition> <fc=#046162><tempC></fc>°C" ] 36000

        -- network activity monitor (dynamic interface resolution)
        , Run DynNetwork     [ "--template" , "<dev>: <fc=#046162><tx></fc>kB/s|<fc=#046162><rx></fc>kB/s"] 10

        -- custom vpn status
        , Run Com "harunou" ["epo", "vpn-status"] "epo-vpn" 600 

        -- cpu activity monitor
        , Run Cpu            [ "--template" , "Cpu: <fc=#046162><total></fc>%"] 10

        -- memory usage monitor
        , Run Memory         [ "--template" , "Mem: <fc=#046162><usedratio></fc>%"] 10

        -- battery monitor
        , Run Battery        [ "--template" , "Batt: <acstatus>"
                             , "--Low"      , "10"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"      , "darkred"
                             , "--normal"   , "#046162"
                             , "--high"     , "#046162"

                             , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "v<left>% (<timeleft>)"
                                       -- AC "on" status
                                       , "-O"	, "<fc=#046162>^<left>%</fc>"
                                       -- charged status
                                       , "-i"	, "<fc=#046162>=<left>%</fc>"
                             ] 50

        -- time and date indicator 
        -- man strftime
        , Run Date           "<fc=#ABABAB>%d-%m-%Y (%a) %H:%M</fc>" "date" 10

        -- keyboard layout indicator
        , Run Kbd            [ ("ru"         , "<fc=#046162>RU</fc>")
                             , ("us"         , "<fc=#046162>EN</fc>")
                             ]
        -- get notifications from xmonad
        , Run XMonadLog

        ]
        
   }
