<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clock" />
        <signal name="XLXN_6" />
        <signal name="reset" />
        <signal name="sensor" />
        <signal name="speed(5:0)" />
        <signal name="speed(5)" />
        <signal name="speed(3)" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="FG" />
        <signal name="FR" />
        <signal name="HG" />
        <signal name="HR" />
        <signal name="hwy_turn" />
        <signal name="farm_turn" />
        <signal name="hwy_cross" />
        <signal name="XLXN_42" />
        <signal name="XLXN_43" />
        <signal name="XLXN_44" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="XLXN_47" />
        <signal name="XLXN_48" />
        <signal name="XLXN_49" />
        <signal name="HTG" />
        <signal name="HTR" />
        <signal name="HTY" />
        <signal name="FTG" />
        <signal name="FTR" />
        <signal name="FTY" />
        <signal name="HCG" />
        <signal name="HCR" />
        <signal name="HCY" />
        <signal name="FCG" />
        <signal name="FCR" />
        <signal name="FCY" />
        <signal name="speed(4)" />
        <signal name="XLXN_52" />
        <port polarity="Input" name="clock" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="sensor" />
        <port polarity="Output" name="FG" />
        <port polarity="Output" name="FR" />
        <port polarity="Output" name="HG" />
        <port polarity="Output" name="HR" />
        <port polarity="Input" name="hwy_turn" />
        <port polarity="Input" name="farm_turn" />
        <port polarity="Input" name="hwy_cross" />
        <port polarity="Output" name="HTG" />
        <port polarity="Output" name="HTR" />
        <port polarity="Output" name="HTY" />
        <port polarity="Output" name="FTG" />
        <port polarity="Output" name="FTR" />
        <port polarity="Output" name="FTY" />
        <port polarity="Output" name="HCG" />
        <port polarity="Output" name="HCR" />
        <port polarity="Output" name="HCY" />
        <port polarity="Output" name="FCG" />
        <port polarity="Output" name="FCR" />
        <port polarity="Output" name="FCY" />
        <blockdef name="state_machine">
            <timestamp>2023-12-13T23:6:33</timestamp>
            <line x2="0" y1="544" y2="544" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <line x2="384" y1="224" y2="224" x1="320" />
            <line x2="384" y1="288" y2="288" x1="320" />
            <line x2="384" y1="352" y2="352" x1="320" />
            <line x2="384" y1="416" y2="416" x1="320" />
            <line x2="384" y1="480" y2="480" x1="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-320" height="896" />
        </blockdef>
        <blockdef name="d2_4e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="slow_clock">
            <timestamp>2023-12-13T21:57:26</timestamp>
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="256" x="64" y="-128" height="192" />
        </blockdef>
        <block symbolname="d2_4e" name="XLXI_3">
            <blockpin signalname="XLXN_14" name="A0" />
            <blockpin signalname="XLXN_13" name="A1" />
            <blockpin signalname="XLXN_52" name="E" />
            <blockpin signalname="XLXN_18" name="D0" />
            <blockpin signalname="XLXN_20" name="D1" />
            <blockpin signalname="XLXN_19" name="D2" />
            <blockpin name="D3" />
        </block>
        <block symbolname="d2_4e" name="XLXI_4">
            <blockpin signalname="XLXN_16" name="A0" />
            <blockpin signalname="XLXN_15" name="A1" />
            <blockpin signalname="XLXN_52" name="E" />
            <blockpin signalname="XLXN_24" name="D0" />
            <blockpin signalname="XLXN_25" name="D1" />
            <blockpin signalname="XLXN_26" name="D2" />
            <blockpin name="D3" />
        </block>
        <block symbolname="or2" name="XLXI_8">
            <blockpin signalname="XLXN_19" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="HG" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_9">
            <blockpin signalname="XLXN_19" name="I0" />
            <blockpin signalname="XLXN_20" name="I1" />
            <blockpin signalname="HR" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_10">
            <blockpin signalname="XLXN_26" name="I0" />
            <blockpin signalname="XLXN_24" name="I1" />
            <blockpin signalname="FG" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_11">
            <blockpin signalname="XLXN_26" name="I0" />
            <blockpin signalname="XLXN_25" name="I1" />
            <blockpin signalname="FR" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_14">
            <blockpin signalname="XLXN_52" name="P" />
        </block>
        <block symbolname="slow_clock" name="XLXI_16">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="XLXN_6" name="clear" />
            <blockpin signalname="speed(5:0)" name="speed(5:0)" />
        </block>
        <block symbolname="d2_4e" name="XLXI_17">
            <blockpin signalname="XLXN_46" name="A0" />
            <blockpin signalname="XLXN_47" name="A1" />
            <blockpin signalname="XLXN_52" name="E" />
            <blockpin signalname="FTG" name="D0" />
            <blockpin signalname="FTR" name="D1" />
            <blockpin signalname="FTY" name="D2" />
            <blockpin name="D3" />
        </block>
        <block symbolname="d2_4e" name="XLXI_18">
            <blockpin signalname="XLXN_44" name="A0" />
            <blockpin signalname="XLXN_45" name="A1" />
            <blockpin signalname="XLXN_52" name="E" />
            <blockpin signalname="HCG" name="D0" />
            <blockpin signalname="HCR" name="D1" />
            <blockpin signalname="HCY" name="D2" />
            <blockpin name="D3" />
        </block>
        <block symbolname="d2_4e" name="XLXI_19">
            <blockpin signalname="XLXN_48" name="A0" />
            <blockpin signalname="XLXN_49" name="A1" />
            <blockpin signalname="XLXN_52" name="E" />
            <blockpin signalname="HTG" name="D0" />
            <blockpin signalname="HTR" name="D1" />
            <blockpin signalname="HTY" name="D2" />
            <blockpin name="D3" />
        </block>
        <block symbolname="d2_4e" name="XLXI_20">
            <blockpin signalname="XLXN_42" name="A0" />
            <blockpin signalname="XLXN_43" name="A1" />
            <blockpin signalname="XLXN_52" name="E" />
            <blockpin signalname="FCG" name="D0" />
            <blockpin signalname="FCR" name="D1" />
            <blockpin signalname="FCY" name="D2" />
            <blockpin name="D3" />
        </block>
        <block symbolname="state_machine" name="XLXI_21">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="sensor" name="sensor" />
            <blockpin signalname="speed(5)" name="long" />
            <blockpin signalname="speed(4)" name="med" />
            <blockpin signalname="speed(3)" name="short" />
            <blockpin signalname="hwy_turn" name="hwy_turn" />
            <blockpin signalname="farm_turn" name="farm_turn" />
            <blockpin signalname="hwy_cross" name="hwy_cross" />
            <blockpin signalname="XLXN_13" name="HL1" />
            <blockpin signalname="XLXN_14" name="HL0" />
            <blockpin signalname="XLXN_15" name="FL1" />
            <blockpin signalname="XLXN_16" name="FL0" />
            <blockpin signalname="XLXN_49" name="HT1" />
            <blockpin signalname="XLXN_48" name="HT0" />
            <blockpin signalname="XLXN_47" name="FT1" />
            <blockpin signalname="XLXN_46" name="FT0" />
            <blockpin signalname="XLXN_45" name="HC1" />
            <blockpin signalname="XLXN_44" name="HC0" />
            <blockpin signalname="XLXN_43" name="FC1" />
            <blockpin signalname="XLXN_42" name="FC0" />
            <blockpin signalname="XLXN_6" name="clear" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="clock">
            <wire x2="1088" y1="1008" y2="1008" x1="816" />
            <wire x2="1088" y1="1008" y2="1168" x1="1088" />
            <wire x2="1792" y1="1008" y2="1008" x1="1088" />
            <wire x2="1792" y1="1008" y2="1200" x1="1792" />
        </branch>
        <branch name="reset">
            <wire x2="768" y1="1360" y2="1360" x1="752" />
            <wire x2="1504" y1="1360" y2="1360" x1="768" />
            <wire x2="1504" y1="1264" y2="1360" x1="1504" />
            <wire x2="1792" y1="1264" y2="1264" x1="1504" />
        </branch>
        <branch name="sensor">
            <wire x2="752" y1="1456" y2="1456" x1="736" />
            <wire x2="1568" y1="1456" y2="1456" x1="752" />
            <wire x2="1792" y1="1328" y2="1328" x1="1568" />
            <wire x2="1568" y1="1328" y2="1456" x1="1568" />
        </branch>
        <iomarker fontsize="28" x="752" y="1360" name="reset" orien="R180" />
        <iomarker fontsize="28" x="736" y="1456" name="sensor" orien="R180" />
        <branch name="speed(5:0)">
            <wire x2="1632" y1="1168" y2="1168" x1="1472" />
            <wire x2="1632" y1="1168" y2="1392" x1="1632" />
            <wire x2="1632" y1="1392" y2="1456" x1="1632" />
            <wire x2="1632" y1="1456" y2="1520" x1="1632" />
            <wire x2="1632" y1="1520" y2="1536" x1="1632" />
            <wire x2="1664" y1="1536" y2="1536" x1="1632" />
            <wire x2="1664" y1="1536" y2="1904" x1="1664" />
            <wire x2="1648" y1="1904" y2="1904" x1="1632" />
            <wire x2="1664" y1="1904" y2="1904" x1="1648" />
        </branch>
        <bustap x2="1728" y1="1392" y2="1392" x1="1632" />
        <branch name="speed(5)">
            <wire x2="1744" y1="1392" y2="1392" x1="1728" />
            <wire x2="1792" y1="1392" y2="1392" x1="1744" />
        </branch>
        <branch name="speed(3)">
            <wire x2="1744" y1="1456" y2="1456" x1="1728" />
            <wire x2="1792" y1="1456" y2="1456" x1="1744" />
        </branch>
        <instance x="2400" y="1232" name="XLXI_3" orien="R0" />
        <instance x="2400" y="1648" name="XLXI_4" orien="R0" />
        <branch name="XLXN_13">
            <wire x2="2288" y1="1200" y2="1200" x1="2176" />
            <wire x2="2288" y1="976" y2="1200" x1="2288" />
            <wire x2="2384" y1="976" y2="976" x1="2288" />
            <wire x2="2400" y1="976" y2="976" x1="2384" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="2272" y1="1264" y2="1264" x1="2176" />
            <wire x2="2272" y1="912" y2="1264" x1="2272" />
            <wire x2="2384" y1="912" y2="912" x1="2272" />
            <wire x2="2400" y1="912" y2="912" x1="2384" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="2288" y1="1328" y2="1328" x1="2176" />
            <wire x2="2288" y1="1328" y2="1392" x1="2288" />
            <wire x2="2384" y1="1392" y2="1392" x1="2288" />
            <wire x2="2400" y1="1392" y2="1392" x1="2384" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="2240" y1="1392" y2="1392" x1="2176" />
            <wire x2="2240" y1="1344" y2="1392" x1="2240" />
            <wire x2="2352" y1="1344" y2="1344" x1="2240" />
            <wire x2="2352" y1="1328" y2="1344" x1="2352" />
            <wire x2="2384" y1="1328" y2="1328" x1="2352" />
            <wire x2="2400" y1="1328" y2="1328" x1="2384" />
        </branch>
        <instance x="3072" y="1040" name="XLXI_8" orien="R0" />
        <instance x="3056" y="1184" name="XLXI_9" orien="R0" />
        <branch name="XLXN_18">
            <wire x2="2800" y1="912" y2="912" x1="2784" />
            <wire x2="3072" y1="912" y2="912" x1="2800" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="2928" y1="1040" y2="1040" x1="2784" />
            <wire x2="2928" y1="1040" y2="1120" x1="2928" />
            <wire x2="3056" y1="1120" y2="1120" x1="2928" />
            <wire x2="2928" y1="976" y2="1040" x1="2928" />
            <wire x2="3072" y1="976" y2="976" x1="2928" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="2912" y1="976" y2="976" x1="2784" />
            <wire x2="2912" y1="976" y2="1056" x1="2912" />
            <wire x2="3056" y1="1056" y2="1056" x1="2912" />
        </branch>
        <instance x="3072" y="1440" name="XLXI_10" orien="R0" />
        <instance x="3072" y="1600" name="XLXI_11" orien="R0" />
        <branch name="XLXN_24">
            <wire x2="2928" y1="1328" y2="1328" x1="2784" />
            <wire x2="2928" y1="1312" y2="1328" x1="2928" />
            <wire x2="3072" y1="1312" y2="1312" x1="2928" />
        </branch>
        <branch name="XLXN_25">
            <wire x2="2928" y1="1392" y2="1392" x1="2784" />
            <wire x2="2928" y1="1392" y2="1472" x1="2928" />
            <wire x2="3072" y1="1472" y2="1472" x1="2928" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="2944" y1="1456" y2="1456" x1="2784" />
            <wire x2="2944" y1="1456" y2="1536" x1="2944" />
            <wire x2="3072" y1="1536" y2="1536" x1="2944" />
            <wire x2="2944" y1="1376" y2="1456" x1="2944" />
            <wire x2="3072" y1="1376" y2="1376" x1="2944" />
        </branch>
        <branch name="FG">
            <wire x2="3360" y1="1344" y2="1344" x1="3328" />
        </branch>
        <iomarker fontsize="28" x="3360" y="1344" name="FG" orien="R0" />
        <branch name="FR">
            <wire x2="3360" y1="1504" y2="1504" x1="3328" />
        </branch>
        <iomarker fontsize="28" x="3360" y="1504" name="FR" orien="R0" />
        <branch name="HG">
            <wire x2="3360" y1="944" y2="944" x1="3328" />
        </branch>
        <iomarker fontsize="28" x="3360" y="944" name="HG" orien="R0" />
        <branch name="HR">
            <wire x2="3344" y1="1088" y2="1088" x1="3312" />
        </branch>
        <iomarker fontsize="28" x="3344" y="1088" name="HR" orien="R0" />
        <branch name="XLXN_6">
            <wire x2="1008" y1="1232" y2="1568" x1="1008" />
            <wire x2="2192" y1="1568" y2="1568" x1="1008" />
            <wire x2="1072" y1="1232" y2="1232" x1="1008" />
            <wire x2="1088" y1="1232" y2="1232" x1="1072" />
            <wire x2="2192" y1="1456" y2="1456" x1="2176" />
            <wire x2="2192" y1="1456" y2="1568" x1="2192" />
        </branch>
        <iomarker fontsize="28" x="816" y="1008" name="clock" orien="R180" />
        <instance x="2400" y="1664" name="XLXI_14" orien="R90" />
        <instance x="1088" y="1264" name="XLXI_16" orien="R0">
        </instance>
        <bustap x2="1728" y1="1456" y2="1456" x1="1632" />
        <branch name="hwy_turn">
            <wire x2="1792" y1="1584" y2="1584" x1="1632" />
        </branch>
        <branch name="farm_turn">
            <wire x2="1648" y1="1648" y2="1648" x1="1632" />
            <wire x2="1792" y1="1648" y2="1648" x1="1648" />
        </branch>
        <branch name="hwy_cross">
            <wire x2="1792" y1="1776" y2="1776" x1="1632" />
        </branch>
        <iomarker fontsize="28" x="1632" y="1584" name="hwy_turn" orien="R180" />
        <iomarker fontsize="28" x="1632" y="1648" name="farm_turn" orien="R180" />
        <iomarker fontsize="28" x="1632" y="1776" name="hwy_cross" orien="R180" />
        <instance x="2544" y="2080" name="XLXI_17" orien="R0" />
        <instance x="2544" y="2432" name="XLXI_18" orien="R0" />
        <instance x="2560" y="2784" name="XLXI_20" orien="R0" />
        <instance x="2384" y="784" name="XLXI_19" orien="R0" />
        <branch name="XLXN_42">
            <wire x2="2368" y1="1968" y2="1968" x1="2176" />
            <wire x2="2368" y1="1968" y2="2464" x1="2368" />
            <wire x2="2560" y1="2464" y2="2464" x1="2368" />
        </branch>
        <branch name="XLXN_43">
            <wire x2="2352" y1="1904" y2="1904" x1="2176" />
            <wire x2="2352" y1="1904" y2="2528" x1="2352" />
            <wire x2="2560" y1="2528" y2="2528" x1="2352" />
        </branch>
        <branch name="XLXN_44">
            <wire x2="2336" y1="1840" y2="1840" x1="2176" />
            <wire x2="2336" y1="1840" y2="2112" x1="2336" />
            <wire x2="2544" y1="2112" y2="2112" x1="2336" />
        </branch>
        <branch name="XLXN_45">
            <wire x2="2320" y1="1776" y2="1776" x1="2176" />
            <wire x2="2320" y1="1776" y2="2176" x1="2320" />
            <wire x2="2544" y1="2176" y2="2176" x1="2320" />
        </branch>
        <branch name="XLXN_46">
            <wire x2="2240" y1="1712" y2="1712" x1="2176" />
            <wire x2="2240" y1="1616" y2="1712" x1="2240" />
            <wire x2="2528" y1="1616" y2="1616" x1="2240" />
            <wire x2="2528" y1="1616" y2="1760" x1="2528" />
            <wire x2="2544" y1="1760" y2="1760" x1="2528" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="2352" y1="1648" y2="1648" x1="2176" />
            <wire x2="2352" y1="1648" y2="1824" x1="2352" />
            <wire x2="2544" y1="1824" y2="1824" x1="2352" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="2256" y1="1584" y2="1584" x1="2176" />
            <wire x2="2256" y1="464" y2="1584" x1="2256" />
            <wire x2="2384" y1="464" y2="464" x1="2256" />
        </branch>
        <branch name="XLXN_49">
            <wire x2="2224" y1="1520" y2="1520" x1="2176" />
            <wire x2="2224" y1="528" y2="1520" x1="2224" />
            <wire x2="2384" y1="528" y2="528" x1="2224" />
        </branch>
        <branch name="HTG">
            <wire x2="2832" y1="464" y2="464" x1="2768" />
        </branch>
        <branch name="HTR">
            <wire x2="2848" y1="528" y2="528" x1="2768" />
        </branch>
        <branch name="HTY">
            <wire x2="2832" y1="592" y2="592" x1="2768" />
        </branch>
        <branch name="FTG">
            <wire x2="2976" y1="1760" y2="1760" x1="2928" />
        </branch>
        <branch name="FTR">
            <wire x2="2976" y1="1824" y2="1824" x1="2928" />
        </branch>
        <branch name="FTY">
            <wire x2="2992" y1="1888" y2="1888" x1="2928" />
        </branch>
        <branch name="HCG">
            <wire x2="2992" y1="2112" y2="2112" x1="2928" />
        </branch>
        <branch name="HCR">
            <wire x2="3008" y1="2176" y2="2176" x1="2928" />
        </branch>
        <branch name="HCY">
            <wire x2="2992" y1="2240" y2="2240" x1="2928" />
        </branch>
        <branch name="FCG">
            <wire x2="3008" y1="2464" y2="2464" x1="2944" />
        </branch>
        <branch name="FCR">
            <wire x2="3008" y1="2528" y2="2528" x1="2944" />
        </branch>
        <branch name="FCY">
            <wire x2="3024" y1="2592" y2="2592" x1="2944" />
        </branch>
        <iomarker fontsize="28" x="2832" y="464" name="HTG" orien="R0" />
        <iomarker fontsize="28" x="2848" y="528" name="HTR" orien="R0" />
        <iomarker fontsize="28" x="2832" y="592" name="HTY" orien="R0" />
        <iomarker fontsize="28" x="2976" y="1760" name="FTG" orien="R0" />
        <iomarker fontsize="28" x="2976" y="1824" name="FTR" orien="R0" />
        <iomarker fontsize="28" x="2992" y="1888" name="FTY" orien="R0" />
        <iomarker fontsize="28" x="2992" y="2112" name="HCG" orien="R0" />
        <iomarker fontsize="28" x="3008" y="2176" name="HCR" orien="R0" />
        <iomarker fontsize="28" x="2992" y="2240" name="HCY" orien="R0" />
        <iomarker fontsize="28" x="3008" y="2464" name="FCG" orien="R0" />
        <iomarker fontsize="28" x="3008" y="2528" name="FCR" orien="R0" />
        <iomarker fontsize="28" x="3024" y="2592" name="FCY" orien="R0" />
        <bustap x2="1648" y1="1904" y2="2000" x1="1648" />
        <branch name="speed(4)">
            <wire x2="1648" y1="2000" y2="2032" x1="1648" />
            <wire x2="1792" y1="2032" y2="2032" x1="1648" />
        </branch>
        <branch name="XLXN_52">
            <wire x2="2384" y1="656" y2="656" x1="2368" />
            <wire x2="2368" y1="656" y2="1104" x1="2368" />
            <wire x2="2384" y1="1104" y2="1104" x1="2368" />
            <wire x2="2400" y1="1104" y2="1104" x1="2384" />
            <wire x2="2384" y1="1104" y2="1520" x1="2384" />
            <wire x2="2384" y1="1520" y2="1728" x1="2384" />
            <wire x2="2400" y1="1728" y2="1728" x1="2384" />
            <wire x2="2384" y1="1728" y2="1952" x1="2384" />
            <wire x2="2544" y1="1952" y2="1952" x1="2384" />
            <wire x2="2384" y1="1952" y2="2304" x1="2384" />
            <wire x2="2544" y1="2304" y2="2304" x1="2384" />
            <wire x2="2384" y1="2304" y2="2656" x1="2384" />
            <wire x2="2560" y1="2656" y2="2656" x1="2384" />
            <wire x2="2400" y1="1520" y2="1520" x1="2384" />
        </branch>
        <instance x="1792" y="1488" name="XLXI_21" orien="R0">
        </instance>
    </sheet>
</drawing>