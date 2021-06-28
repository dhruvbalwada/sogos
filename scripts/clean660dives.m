Svec = 33.8:.1:35;
Tvec = .5:.2:3.5;
Svec = Svec';
Smat = Svec*ones(1,length(Tvec));
Tmat = ones(length(Svec),1)*Tvec;
sigma0 = gsw_sigma0(Smat,Tmat);

for i = 49%length(data660)

figure (1)
contour(Svec,Tvec,sigma0',10,'k','showtext','off');
hold on
scatter(data660(i).salinity,data660(i).temperature,10,data660(i).pressure)
hold off
%scatter(data659dives(105).salt,data659dives(105).temp,'r.')

gt10all = find(data660(i).pressure > 10);
[~,idxmax] = max(data660(i).pressure(gt10all));

stdT = std(data660(i).temperature(gt10all));
stdS = std(data660(i).salinity(gt10all));

    figure (2)
    subplot(1,2,1)
    plot(data660(i).temperature(gt10all(1:idxmax)),data660(i).pressure(gt10all(1:idxmax)),'b')
    hold on    
    plot(data660(i).temperature(gt10all(idxmax:end)),data660(i).pressure(gt10all(idxmax:end)),'r')
    plot((mean(data660(i).temperature(gt10all)+2*stdT)*ones(1,length(data660(i).pressure(gt10all)))),data660(i).pressure(gt10all),'k')
    hold off
    %datetick('y')
    set(gca,'Ydir','reverse')
%     xlim([0 4])
    title('temperature')
    subplot(1,2,2)
    plot(data660(i).salinity(gt10all(1:idxmax)),data660(i).pressure(gt10all(1:idxmax)),'b')
    hold on
    plot(data660(i).salinity(gt10all(idxmax:end)),data660(i).pressure(gt10all(idxmax:end)),'r')
    plot((mean(data660(i).temperature(gt10all)+2*stdS)*ones(1,length(data660(i).pressure(gt10all)))),data660(i).pressure(gt10all),'k')
    hold off
    %datetick('y')
    set(gca,'Ydir','reverse')
    legend('downcast','upcast','location','southwest')
%     xlim([33 35])
    title('salinity')
    
    i
    pause
    
end
    
%%
data660 = data;
% dive 26
% idx = find(data660(26).pressure > 670 & data660(26).pressure < 680);
% data660(26).salinity(idx) = NaN;
% dive 38
[~,idx] = max(data660(38).pressure);
data660(38).salinity(idx:end)= NaN;
% dive 49
[~,maxidx] = max(data660(49).pressure);
idx = find(data660(49).pressure > 307 & data660(49).pressure < 317);
idxidx = find(idx > maxidx);
data660(49).salinity(idx(idxidx)) = NaN;
% dive 51
[~,maxidx] = max(data660(51).pressure);
idx = find(data660(51).pressure > 225 & data660(51).pressure < 250);
idxidx = find(idx > maxidx);
data660(51).salinity(idx(idxidx)) = NaN;
% dive 52
idx = find(data660(51).pressure > 205 & data660(51).pressure < 255);
data660(51).salinity(idx) = NaN;
% dive 57
[~,maxidx] = max(data660(57).pressure);
idx = find(data660(57).pressure > 304 & data660(57).pressure < 312);
idxidx = find(idx > maxidx);
data660(57).salinity(idx(idxidx)) = NaN;
% dive 65
[~,maxidx] = max(data660(65).pressure);
idx = find(data660(65).pressure > 295 & data660(65).pressure < 320);
idxidx = find(idx < maxidx);
data660(65).salinity(idx(idxidx)) = NaN;
% dive 68
[~,idx] = min(abs(445.9-data660(68).pressure));
data660(68).salinity(idx) = NaN;
[~,idx] = min(abs(491.3-data660(68).pressure));
data660(68).salinity(idx) = NaN;
% dive 70
[~,maxidx] = max(data660(70).pressure);
idx = find(data660(70).pressure > 420 & data660(70).pressure < 500);
idxidx = find(idx < maxidx);
data660(70).salinity(idx(idxidx)) = NaN;
idx = find(data660(70).pressure > 250 & data660(70).pressure < 262);
idxidx = find(idx > maxidx);
data660(70).salinity(idx(idxidx)) = NaN;
% dive 72
[~,maxidx] = max(data660(72).pressure);
idx = find(data660(72).pressure > 235 & data660(72).pressure < 270);
idxidx = find(idx > maxidx);
data660(72).salinity(idx(idxidx)) = NaN;
% dive 75
[~,maxidx] = max(data660(75).pressure);
idx = find(data660(75).pressure > 330 & data660(75).pressure < 450);
idxidx = find(idx < maxidx);
data660(75).salinity(idx(idxidx)) = NaN;
idx = find(data660(75).pressure > 436 & data660(75).pressure < 443);
idxidx = find(idx > maxidx);
data660(75).salinity(idx(idxidx)) = NaN;
% dive 77
idx = find(data660(77).pressure > 300 & data660(77).pressure < 500); % both messy
data660(77).salinity(idx) = NaN;
% dive 84
[~,maxidx] = max(data660(84).pressure);
idx = find(data660(84).pressure > 220 & data660(84).pressure < 280);
idxidx = find(idx < maxidx);
data660(84).salinity(idx(idxidx)) = NaN;
% dive 85
[~,maxidx] = max(data660(84).pressure);
idx = find(data660(85).pressure > 200 & data660(85).pressure < 225);
idxidx = find(idx > maxidx);
data660(85).salinity(idx(idxidx)) = NaN;
% dive 89
[~,maxidx] = max(data660(89).pressure);
idx = find(data660(89).pressure > 240 & data660(89).pressure < 350);
idxidx = find(idx > maxidx);
data660(89).salinity(idx(idxidx)) = NaN;
% dive 90
[~,maxidx] = max(data660(90).pressure);
idx = find(data660(90).pressure > 230 & data660(90).pressure < 320);
idxidx = find(idx < maxidx);
data660(90).salinity(idx(idxidx)) = NaN;
% dive 91
[~,maxidx] = max(data660(91).pressure);
idx = find(data660(91).pressure > 100 & data660(91).pressure < 310);
idxidx = find(idx > maxidx);
data660(91).salinity(idx(idxidx)) = NaN;
% dive 92
[~,maxidx] = max(data660(92).pressure);
idx = find(data660(92).pressure > 120 & data660(92).pressure < 240);
idxidx = find(idx < maxidx);
data660(92).salinity(idx(idxidx)) = NaN;
% dive 93
[~,maxidx] = max(data660(93).pressure);
idx = find(data660(93).pressure > 200 & data660(93).pressure < 400);
idxidx = find(idx > maxidx);
data660(93).salinity(idx(idxidx)) = NaN;
% dive 94
[~,maxidx] = max(data660(94).pressure);
idx = find(data660(94).pressure > 150 & data660(94).pressure < 350);
idxidx = find(idx < maxidx);
data660(94).salinity(idx(idxidx)) = NaN;
% dive 96
[~,maxidx] = max(data660(96).pressure);
idx = find(data660(96).pressure > 502 & data660(96).pressure < 512);
idxidx = find(idx < maxidx);
data660(96).salinity(idx(idxidx)) = NaN;
% dive 99
[~,maxidx] = max(data660(99).pressure);
idx = find(data660(99).pressure < 60);
idxidx = find(idx < maxidx);
data660(99).salinity(idx(idxidx)) = NaN;
% dive 100 
[~,maxidx] = max(data660(100).pressure);
idx = find(data660(100).pressure > 450 & data660(100).pressure < 500);
idxidx = find(idx > maxidx);
data660(100).salinity(idx(idxidx)) = NaN;
% dive 101
[~,maxidx] = max(data660(101).pressure);
idx = find(data660(101).pressure > 370 & data660(101).pressure < 420);
idxidx = find(idx < maxidx);
data660(101).salinity(idx(idxidx)) = NaN;
% dive 102
idx = find(data660(102).pressure > 410 & data660(102).pressure < 460);
data660(102).salinity(idx) = NaN;
idx = find(data660(102).pressure > 600);
data660(102).salinity(idx) = NaN;
% dive 103
idx = find(data660(103).pressure > 600);
data660(103).salinity(idx) = NaN;
% dive 105
[~,idx] = max(data660(105).pressure);
data660(105).salinity(1:idx)= NaN;
idx = find(data660(105).pressure > 350 & data660(105).pressure < 400);
idxidx = find(idx > maxidx);
data660(105).salinity(idx(idxidx)) = NaN;
% dive 106
[~,maxidx] = max(data660(106).pressure);
idx = find(data660(106).pressure > 475 & data660(106).pressure < 495);
idxidx = find(idx < maxidx);
data660(106).salinity(idx(idxidx)) = NaN;
% dive 108
[~,maxidx] = max(data660(108).pressure);
idx = find(data660(108).pressure > 459 & data660(108).pressure < 461);
idxidx = find(idx > maxidx);
data660(108).salinity(idx(idxidx)) = NaN;
% dive 111
idx = find(data660(111).pressure > 450 & data660(111).pressure < 570);
data660(111).salinity(idx) = NaN;
% dive 115
[~,maxidx] = max(data660(115).pressure);
idx = find(data660(115).pressure > 575 & data660(115).pressure < 590);
idxidx = find(idx > maxidx);
data660(115).salinity(idx(idxidx)) = NaN;
idx = find(data660(115).pressure > 600 & data660(115).pressure < 630);
idxidx = find(idx < maxidx);
data660(115).salinity(idx(idxidx)) = NaN;
% dive 118
[~,maxidx] = max(data660(118).pressure);
idx = find(data660(118).pressure > 150 & data660(118).pressure < 300);
idxidx = find(idx > maxidx);
data660(118).salinity(idx(idxidx)) = NaN;
% dive 119
[~,maxidx] = max(data660(119).pressure);
idx = find(data660(119).pressure > 190 & data660(119).pressure < 240);
idxidx = find(idx > maxidx);
data660(119).salinity(idx(idxidx)) = NaN;
% dive 120
idx = find(data660(120).pressure > 200 & data660(120).pressure < 320); %both bad
data660(120).salinity(idx) = NaN;
% dive 121
[~,idx] = min(abs(289.8-data660(121).pressure));
data660(121).salinity(idx) = NaN;
[~,maxidx] = max(data660(121).pressure);
idx = find(data660(121).pressure > 130 & data660(121).pressure < 140);
idxidx = find(idx < maxidx);
data660(121).salinity(idx(idxidx)) = NaN;
% dive 122
[~,maxidx] = max(data660(122).pressure);
idx = find(data660(122).pressure > 340 & data660(122).pressure < 440);
idxidx = find(idx > maxidx);
data660(122).salinity(idx(idxidx)) = NaN;
idx = find(data660(122).pressure > 190 & data660(122).pressure < 202);
idxidx = find(idx > maxidx);
data660(122).salinity(idx(idxidx)) = NaN;
idx = find(data660(122).pressure > 673 & data660(122).pressure < 680);
idxidx = find(idx > maxidx);
data660(122).salinity(idx(idxidx)) = NaN;
% dive 123
[~,maxidx] = max(data660(123).pressure);
idx = find(data660(123).pressure > 194 & data660(123).pressure < 202);
idxidx = find(idx < maxidx);
data660(123).salinity(idx(idxidx)) = NaN;
idx = find(data660(123).pressure > 320 & data660(123).pressure < 328);
idxidx = find(idx > maxidx);
data660(123).salinity(idx(idxidx)) = NaN;
idx = find(data660(123).pressure > 342 & data660(123).pressure < 352);
idxidx = find(idx < maxidx);
data660(123).salinity(idx(idxidx)) = NaN;
idx = find(data660(123).pressure > 415 & data660(123).pressure < 465);
idxidx = find(idx < maxidx);
data660(123).salinity(idx(idxidx)) = NaN;
% dive 124
[~,maxidx] = max(data660(124).pressure);
idx = find(data660(124).pressure > 300 & data660(124).pressure < 420);
idxidx = find(idx > maxidx);
data660(124).salinity(idx(idxidx)) = NaN;
% dive 125
[~,maxidx] = max(data660(125).pressure);
idx = find(data660(125).pressure > 190 & data660(125).pressure < 196);
idxidx = find(idx < maxidx);
data660(125).salinity(idx(idxidx)) = NaN;
idx = find(data660(125).pressure > 359 & data660(125).pressure < 360);
idxidx = find(idx < maxidx);
data660(125).salinity(idx(idxidx)) = NaN;
% dive 126
[~,maxidx] = max(data660(126).pressure);
idx = find(data660(126).pressure > 132 & data660(126).pressure < 136);
idxidx = find(idx > maxidx);
data660(126).salinity(idx(idxidx)) = NaN;
idxidx = find(idx < maxidx);
idx = find(data660(126).pressure > 348 & data660(126).pressure < 360);
data660(126).salinity(idx(idxidx)) = NaN;
idx = find(data660(126).pressure > 526 & data660(126).pressure < 532);
idxidx = find(idx > maxidx);
data660(126).salinity(idx(idxidx)) = NaN;
% dive 127
idx = find(data660(127).pressure > 130 & data660(127).pressure < 350); %both up/down bad
data660(127).salinity(idx) = NaN;
% dive 128
[~,idx] = max(data660(128).pressure);
data660(128).salinity(1:idx)= NaN; %downcast bad
% dive 129
[~,maxidx] = max(data660(129).pressure);
idx = find(data660(129).pressure > 380 & data660(129).pressure < 405);
idxidx = find(idx < maxidx);
data660(129).salinity(idx(idxidx)) = NaN;
% dive 132
[~,maxidx] = max(data660(132).pressure);
idx = find(data660(132).pressure > 260 & data660(132).pressure < 380);
idxidx = find(idx > maxidx);
data660(132).salinity(idx(idxidx)) = NaN;
% dive 133
[~,maxidx] = max(data660(133).pressure);
idx = find(data660(133).pressure > 248 & data660(133).pressure < 255);
idxidx = find(idx < maxidx);
data660(133).salinity(idx(idxidx)) = NaN;
idx = find(data660(133).pressure > 326 & data660(133).pressure < 336);
idxidx = find(idx < maxidx);
data660(133).salinity(idx(idxidx)) = NaN;
% dive 134 *******************
% dive 136
[~,maxidx] = max(data660(136).pressure);
idx = find(data660(136).pressure > 608 & data660(136).pressure < 618);
idxidx = find(idx > maxidx);
data660(136).salinity(idx(idxidx)) = NaN;
idx = find(data660(136).pressure > 400 & data660(136).pressure < 480);
data660(136).salinity(idx) = NaN;
% dive 137 
[~,maxidx] = max(data660(137).pressure);
idx = find(data660(137).pressure > 355 & data660(137).pressure < 370);
idxidx = find(idx > maxidx);
data660(137).salinity(idx(idxidx)) = NaN;
% dive 141
[~,maxidx] = max(data660(141).pressure);
idx = find(data660(141).pressure > 282 & data660(141).pressure < 290);
idxidx = find(idx < maxidx);
data660(141).salinity(idx(idxidx)) = NaN;
idx = find(data660(141).pressure > 420 & data660(141).pressure < 470);
idxidx = find(idx < maxidx);
data660(141).salinity(idx(idxidx)) = NaN;
% dive 142
[~,maxidx] = max(data660(142).pressure);
idx = find(data660(142).pressure > 530 & data660(142).pressure < 540);
idxidx = find(idx > maxidx);
data660(142).salinity(idx(idxidx)) = NaN;
% dive 144
[~,maxidx] = max(data660(144).pressure);
idx = find(data660(144).pressure > 293 & data660(144).pressure < 302);
idxidx = find(idx < maxidx);
data660(144).salinity(idx(idxidx)) = NaN;
% dive 150
[~,maxidx] = max(data660(144).pressure);
idx = find(data660(144).pressure > 420 & data660(144).pressure < 500);
idxidx = find(idx < maxidx);
data660(144).salinity(idx(idxidx)) = NaN;
idx = find(data660(144).pressure > 260 & data660(144).pressure < 275);
idxidx = find(idx < maxidx);
data660(144).salinity(idx(idxidx)) = NaN;
% dive 153
[~,maxidx] = max(data660(153).pressure);
idx = find(data660(153).pressure > 833 & data660(153).pressure < 850);
idxidx = find(idx < maxidx);
data660(153).salinity(idx(idxidx)) = NaN;
% dive 154
idx = find(data660(154).pressure > 337 & data660(154).pressure < 375);
data660(154).salinity(idx) = NaN; % both bad
% dive 157
[~,maxidx] = max(data660(157).pressure);
idx = find(data660(157).pressure > 440 & data660(157).pressure < 540);
idxidx = find(idx < maxidx);
data660(157).salinity(idx(idxidx)) = NaN;
% dive 163
[~,maxidx] = max(data660(163).pressure);
idx = find(data660(163).pressure > 410 & data660(163).pressure < 460);
idxidx = find(idx > maxidx);
data660(163).salinity(idx(idxidx)) = NaN;
% dive 167
[~,maxidx] = max(data660(167).pressure);
idx = find(data660(167).pressure > 138 & data660(167).pressure < 182);
idxidx = find(idx > maxidx);
data660(167).salinity(idx(idxidx)) = NaN;
% dive 168
[~,maxidx] = max(data660(168).pressure);
idx = find(data660(168).pressure < 60);
idxidx = find(idx < maxidx);
data660(168).salinity(idx(idxidx)) = NaN;
% dive 172 **********
% dive 175
[~,maxidx] = max(data660(175).pressure);
idx = find(data660(175).pressure > 893 & data660(175).pressure < 902);
idxidx = find(idx < maxidx);
data660(175).salinity(idx(idxidx)) = NaN;
idx = find(data660(175).pressure > 386 & data660(175).pressure < 400);
idxidx = find(idx < maxidx);
data660(175).salinity(idx(idxidx)) = NaN;
% dive 176
[~,maxidx] = max(data660(176).pressure);
idx = find(data660(176).pressure > 212 & data660(176).pressure < 218);
idxidx = find(idx < maxidx);
data660(176).salinity(idx(idxidx)) = NaN;
idx = find(data660(176).pressure > 404 & data660(176).pressure < 412);
idxidx = find(idx < maxidx);
data660(176).salinity(idx(idxidx)) = NaN;
% dive 180
[~,maxidx] = max(data660(180).pressure);
idx = find(data660(180).pressure > 167 & data660(180).pressure < 173);
idxidx = find(idx < maxidx);
data660(180).salinity(idx(idxidx)) = NaN;
idx = find(data660(180).pressure > 437 & data660(180).pressure < 444);
idxidx = find(idx > maxidx);
data660(180).salinity(idx(idxidx)) = NaN;
idx = find(data660(180).pressure > 411 & data660(180).pressure < 418);
idxidx = find(idx < maxidx);
data660(180).salinity(idx(idxidx)) = NaN;
% dive 182
[~,maxidx] = max(data660(182).pressure);
idx = find(data660(182).pressure > 350 & data660(182).pressure < 480);
idxidx = find(idx < maxidx);
data660(182).salinity(idx(idxidx)) = NaN;
% dive 183
[~,maxidx] = max(data660(183).pressure);
idx = find(data660(183).pressure > 398 & data660(183).pressure < 404);
idxidx = find(idx > maxidx);
data660(183).salinity(idx(idxidx)) = NaN;
% dive 185
idx = find(data660(185).pressure > 335 & data660(185).pressure < 510);
data660(185).salinity(idx) = NaN; % both bad
% dive 186
[~,idxmax] = max(data660(186).pressure);
idx = find(data660(186).pressure > 400 & data660(186).pressure < 475);
idxidx = find(idx < maxidx);
data660(186).salinity(idx(idxidx)) = NaN;
% dive 193
[~,idxmax] = max(data660(193).pressure);
idx = find(data660(193).pressure > 405 & data660(193).pressure < 430);
idxidx = find(idx < maxidx);
data660(193).salinity(idx(idxidx)) = NaN;
idx = find(data660(193).pressure > 155 & data660(193).pressure < 170);
data660(193).salinity(idx) = NaN;
% dive 196
[~,idxmax] = max(data660(196).pressure);
idx = find(data660(196).pressure > 915 & data660(196).pressure < 920);
idxidx = find(idx > maxidx);
data660(196).salinity(idx(idxidx)) = NaN;
% dive 199
[~,idxmax] = max(data660(199).pressure);
idx = find(data660(199).pressure > 435 & data660(199).pressure < 455);
idxidx = find(idx < maxidx);
data660(199).salinity(idx(idxidx)) = NaN;
% dive 202
[~,maxidx] = max(data660(202).pressure);
idx = find(data660(202).pressure > 730 & data660(202).pressure < 780);
idxidx = find(idx > maxidx);
data660(202).salinity(idx(idxidx)) = NaN;
idx = find(data660(202).pressure > 564 & data660(202).pressure < 572);
idxidx = find(idx < maxidx);
data660(202).salinity(idx(idxidx)) = NaN;
% dive 203
[~,maxidx] = max(data660(203).pressure);
idx = find(data660(203).pressure > 538 & data660(203).pressure < 546);
idxidx = find(idx > maxidx);
data660(203).salinity(idx(idxidx)) = NaN;
% dive 206
[~,maxidx] = max(data660(206).pressure);
idx = find(data660(206).pressure > 478 & data660(206).pressure < 487);
idxidx = find(idx < maxidx);
data660(206).salinity(idx(idxidx)) = NaN;
idx = find(data660(206).pressure > 425 & data660(206).pressure < 431);
idxidx = find(idx < maxidx);
data660(206).salinity(idx(idxidx)) = NaN;
% dive 207 *********
% dive 209
[~,maxidx] = max(data660(209).pressure);
idx = find(data660(209).pressure > 360 & data660(209).pressure < 440);
idxidx = find(idx > maxidx);
data660(209).salinity(idx(idxidx)) = NaN;
% dive 211
[~,maxidx] = max(data660(211).pressure);
idx = find(data660(211).pressure > 269 & data660(211).pressure < 281);
idxidx = find(idx < maxidx);
data660(211).salinity(idx(idxidx)) = NaN;
% dive 215
[~,maxidx] = max(data660(215).pressure);
idx = find(data660(215).pressure > 349 & data660(215).pressure < 365);
idxidx = find(idx < maxidx);
data660(215).salinity(idx(idxidx)) = NaN;
% dive 217
[~,maxidx] = max(data660(217).pressure);
idx = find(data660(217).pressure > 245 & data660(217).pressure < 250);
idxidx = find(idx < maxidx);
data660(217).salinity(idx(idxidx)) = NaN;
% dive 218
[~,maxidx] = max(data660(218).pressure);
idx = find(data660(218).pressure > 294 & data660(218).pressure < 297);
idxidx = find(idx > maxidx);
data660(218).salinity(idx(idxidx)) = NaN;
% dive 219
[~,maxidx] = max(data660(219).pressure);
idx = find(data660(219).pressure > 255 & data660(219).pressure < 370);
idxidx = find(idx < maxidx);
data660(219).salinity(idx(idxidx)) = NaN;
% dive 225
[~,maxidx] = max(data660(225).pressure);
idx = find(data660(225).pressure > 200 & data660(225).pressure < 340);
idxidx = find(idx < maxidx);
data660(225).salinity(idx(idxidx)) = NaN;
% dive 228
[~,maxidx] = max(data660(228).pressure);
idx = find(data660(228).pressure > 270 & data660(228).pressure < 320);
idxidx = find(idx > maxidx);
data660(228).salinity(idx(idxidx)) = NaN;
% idx = find(data660(228).pressure > 350 & data660(228).pressure < 850);
% data660(228).salinity(idx) = NaN;
% dive 229
% idx = find(data660(229).pressure > 200);
% data660(229).salinity(idx) = NaN;
% dive 231
[~,maxidx] = max(data660(231).pressure);
idx = find(data660(231).pressure > 373 & data660(231).pressure < 382);
idxidx = find(idx < maxidx);
data660(231).salinity(idx(idxidx)) = NaN;
% dive 234
[~,maxidx] = max(data660(234).pressure);
idx = find(data660(234).pressure > 530 & data660(234).pressure < 590);
idxidx = find(idx > maxidx);
data660(234).salinity(idx(idxidx)) = NaN;
% dive 236
[~,maxidx] = max(data660(236).pressure);
idx = find(data660(236).pressure > 302 & data660(236).pressure < 307);
idxidx = find(idx > maxidx);
data660(236).salinity(idx(idxidx)) = NaN;
% dive 237
[~,idx] = max(data660(237).pressure);
data660(237).salinity(1:idx)= NaN;
% % dive 240
% idx = find(data660(240).pressure > 226 & data660(240).pressure < 234);
% data660(240).salinity(idx) = NaN;
% dive 243
[~,maxidx] = max(data660(243).pressure);
idx = find(data660(243).pressure > 334 & data660(243).pressure < 348);
idxidx = find(idx < maxidx);
data660(243).salinity(idx(idxidx)) = NaN;
% dive 247
[~,maxidx] = max(data660(247).pressure);
idx = find(data660(247).pressure > 500 & data660(247).pressure < 510);
idxidx = find(idx > maxidx);
data660(247).salinity(idx(idxidx)) = NaN;
% dive 252
[~,maxidx] = max(data660(252).pressure);
idx = find(data660(252).pressure > 255 & data660(252).pressure < 290);
idxidx = find(idx < maxidx);
data660(252).salinity(idx(idxidx)) = NaN;
% dive 253
[~,maxidx] = max(data660(253).pressure);
idx = find(data660(253).pressure > 180 & data660(253).pressure < 195);
idxidx = find(idx < maxidx);
data660(253).salinity(idx(idxidx)) = NaN;
% dive 254
[~,maxidx] = max(data660(254).pressure);
idx = find(data660(254).pressure > 280 & data660(254).pressure < 294);
idxidx = find(idx < maxidx);
data660(254).salinity(idx(idxidx)) = NaN;
% dive 257
[~,maxidx] = max(data660(257).pressure);
idx = find(data660(257).pressure > 235 & data660(257).pressure < 252);
idxidx = find(idx > maxidx);
data660(257).salinity(idx(idxidx)) = NaN;
idx = find(data660(257).pressure > 625 & data660(257).pressure < 635);
idxidx = find(idx > maxidx);
data660(257).salinity(idx(idxidx)) = NaN;
% dive 259
[~,maxidx] = max(data660(259).pressure);
idx = find(data660(259).pressure > 220 & data660(259).pressure < 270);
idxidx = find(idx > maxidx);
data660(259).salinity(idx(idxidx)) = NaN;
% dive 267
[~,maxidx] = max(data660(267).pressure);
idx = find(data660(267).pressure > 186 & data660(267).pressure < 193);
idxidx = find(idx > maxidx);
data660(267).salinity(idx(idxidx)) = NaN;
% dive 270
[~,maxidx] = max(data660(270).pressure);
idx = find(data660(270).pressure > 275 & data660(270).pressure < 282);
idxidx = find(idx < maxidx);
data660(270).salinity(idx(idxidx)) = NaN;
% dive 276
[~,maxidx] = max(data660(276).pressure);
idx = find(data660(276).pressure < 80);
idxidx = find(idx < maxidx);
data660(276).salinity(idx(idxidx)) = NaN;
% dive 281
[~,maxidx] = max(data660(281).pressure);
idx = find(data(281).pressure < 60);
idxidx = find(idx < maxidx);
data660(281).salinity(idx(idxidx)) = NaN;
% dive 282
[~,maxidx] = max(data660(282).pressure);
idx = find(data660(282).pressure > 605 & data660(282).pressure < 635);
idxidx = find(idx < maxidx);
data660(282).salinity(idx(idxidx)) = NaN;
% dive 283
[~,maxidx] = max(data660(283).pressure);
idx = find(data660(283).pressure > 216 & data660(283).pressure < 227);
idxidx = find(idx < maxidx);
data660(283).salinity(idx(idxidx)) = NaN;
idx = find(data660(283).pressure > 282 & data660(283).pressure < 290);
idxidx = find(idx < maxidx);
data660(283).salinity(idx(idxidx)) = NaN;
% dive 287
[~,maxidx] = max(data660(281).pressure);
idx = find(data660(287).pressure > 210 & data660(287).pressure < 218);
idxidx = find(idx < maxidx);
data660(287).salinity(idx(idxidx)) = NaN;
% dive 291
idx = find(data660(291).pressure > 240 & data660(291).pressure < 450);
data660(291).salinity(idx) = NaN; %both messy
% dive 293
[~,maxidx] = max(data660(293).pressure);
idx = find(data660(293).pressure > 250 & data660(293).pressure < 600);
idxidx = find(idx < maxidx);
data660(293).salinity(idx(idxidx)) = NaN;
% dive 294
[~,maxidx] = max(data660(294).pressure);
idx = find(data660(294).pressure > 420 & data660(294).pressure < 500);
idxidx = find(idx > maxidx);
data660(294).salinity(idx) = NaN;
% dive 295
[~,idx] = min(abs(475.2-data660(295).pressure));
data660(295).salinity(idx) = NaN;
% dive 314
[~,maxidx] = max(data660(314).pressure);
idx = find(data660(314).pressure > 349 & data660(314).pressure < 365);
idxidx = find(idx < maxidx);
data660(314).salinity(idx(idxidx)) = NaN;
% % dive 321
% idx = find(data660(321).pressure > 238 & data660(321).pressure < 248);
% data660(321).salinity(idx) = NaN;
% dive 326
[~,maxidx] = max(data660(326).pressure);
idx = find(data660(326).pressure > 158 & data660(326).pressure < 165);
idxidx = find(idx < maxidx);
data660(326).salinity(idx) = NaN;
% dive 327
[~,idx] = min(abs(224.6-data660(327).pressure));
data660(327).salinity(idx) = NaN;
[~,idx] = min(abs(334.9-data660(327).pressure));
data660(327).salinity(idx) = NaN;
[~,maxidx] = max(data660(327).pressure);
idx = find(data660(327).pressure > 380 & data660(327).pressure < 420);
idxidx = find(idx < maxidx);
data660(327).salinity(idx(idxidx)) = NaN;
% dive 328
[~,maxidx] = max(data660(328).pressure);
idx = find(data660(328).pressure > 175 & data660(328).pressure < 350);
idxidx = find(idx < maxidx);
data660(328).salinity(idx(idxidx)) = NaN;
% % dive 330
% idx = find(data660(330).pressure > 180 & data660(330).pressure < 200);
% data660(330).temperature(idx) = NaN;
% dive 334
[~,maxidx] = max(data660(334).pressure);
idx = find(data660(334).pressure > 360 & data660(334).pressure < 420);
idxidx = find(idx > maxidx);
data660(334).salinity(idx(idxidx)) = NaN;
idx = find(data660(334).pressure > 690 & data660(334).pressure < 760);
idxidx = find(idx > maxidx);
data660(334).salinity(idx(idxidx)) = NaN;
% dive 335
[~,maxidx] = max(data660(335).pressure);
idx = find(data660(335).pressure > 433 & data660(335).pressure < 443);
idxidx = find(idx < maxidx);
data660(335).salinity(idx(idxidx)) = NaN;
idx = find(data660(335).pressure > 535 & data660(335).pressure < 543);
idxidx = find(idx < maxidx);
data660(335).salinity(idx(idxidx)) = NaN;
% dive 336
[~,maxidx] = max(data660(336).pressure);
idx = find(data660(336).pressure < 40);
idxidx = find(idx < maxidx);
data660(336).salinity(idx(idxidx)) = NaN;
% dive 339
[~,maxidx] = max(data660(328).pressure);
idx = find(data660(339).pressure > 175 & data660(339).pressure < 180);
idxidx = find(idx < maxidx);
data660(339).salinity(idx(idxidx)) = NaN;
idx = find(data660(339).pressure > 212 & data660(339).pressure < 216);
idxidx = find(idx < maxidx);
data660(339).salinity(idx(idxidx)) = NaN;
% dive 343
[~,maxidx] = max(data660(343).pressure);
idx = find(data660(343).pressure < 70);
idxidx = find(idx < maxidx);
data660(343).salinity(idx(idxidx)) = NaN;
% dive 344
[~,maxidx] = max(data660(344).pressure);
idx = find(data660(344).pressure < 150);
idxidx = find(idx < maxidx);
data660(344).salinity(idx(idxidx)) = NaN;
% dive 350
[~,maxidx] = max(data660(350).pressure);
idx = find(data660(350).pressure > 317 & data660(350).pressure < 322);
idxidx = find(idx < maxidx);
data660(350).salinity(idx(idxidx)) = NaN;
idx = find(data660(350).pressure > 456 & data660(350).pressure < 461);
idxidx = find(idx < maxidx);
data660(350).salinity(idx(idxidx)) = NaN;
% dive 353
[~,maxidx] = max(data660(353).pressure);
idx = find(data660(353).pressure > 200 & data660(353).pressure < 310);
idxidx = find(idx < maxidx);
data660(353).salinity(idx(idxidx)) = NaN;
idx = find(data660(353).pressure > 470 & data660(353).pressure < 530);
idxidx = find(idx > maxidx);
data660(353).salinity(idx(idxidx)) = NaN;
% dive 356
idx = find(data660(356).pressure > 215 & data660(356).pressure < 270);
data660(356).salinity(idx) = NaN; % both messy
% dive 357
[~,maxidx] = max(data660(357).pressure);
idx = find(data660(357).pressure > 237 & data660(357).pressure < 242);
idxidx = find(idx < maxidx);
data660(357).salinity(idx(idxidx)) = NaN;
idx = find(data660(357).pressure > 329 & data660(357).pressure < 336);
idxidx = find(idx > maxidx);
data660(357).salinity(idx(idxidx)) = NaN;
% dive 359
[~,maxidx] = max(data660(359).pressure);
idx = find(data660(359).pressure < 130);
idxidx = find(idx > maxidx);
data660(359).salinity(idx(idxidx)) = NaN;
idx = find(data660(359).pressure > 220 & data660(359).pressure < 280); % all are messy
data660(359).salinity(idx) = NaN;
idx = find(data660(359).pressure > 400 & data660(359).pressure < 600); % all are messy
data660(359).salinity(idx) = NaN;
% dive 360
[~,maxidx] = max(data660(360).pressure);
idx = find(data660(360).pressure > 230 & data660(360).pressure < 255);
idxidx = find(idx < maxidx);
data660(360).salinity(idx(idxidx)) = NaN;
% dive 368
[~,maxidx] = max(data660(368).pressure);
idx = find(data660(368).pressure > 940);
idxidx = find(idx > maxidx);
data660(368).salinity(idx(idxidx)) = NaN;
% dive 371
idx = find(data660(371).pressure > 270 & data660(371).pressure < 280);
data660(371).salinity(idx) = NaN;
% dive 372
[~,maxidx] = max(data660(372).pressure);
idx = find(data660(372).pressure > 225 & data660(372).pressure < 260);
idxidx = find(idx < maxidx);
data660(372).salinity(idx(idxidx)) = NaN;
idx = find(data660(372).pressure > 182 & data660(372).pressure < 187);
idxidx = find(idx > maxidx);
data660(372).salinity(idx(idxidx)) = NaN;
% dive 373
[~,maxidx] = max(data660(373).pressure);
idx = find(data660(373).pressure > 160 & data660(373).pressure < 185);
idxidx = find(idx < maxidx);
data660(373).salinity(idx(idxidx)) = NaN;
% dive 374
[~,idx] = max(data660(374).pressure);
data660(374).salinity(idx:end)= NaN;
% dive 375
[~,maxidx] = max(data660(375).pressure);
idx = find(data660(375).pressure > 160 & data660(375).pressure < 180);
idxidx = find(idx < maxidx);
data660(375).salinity(idx(idxidx)) = NaN;
idx = find(data660(375).pressure > 295 & data660(375).pressure < 325);
idxidx = find(idx > maxidx);
data660(375).salinity(idx(idxidx)) = NaN;
idx = find(data660(375).pressure > 563 & data660(375).pressure < 568);
idxidx = find(idx < maxidx);
data660(375).salinity(idx(idxidx)) = NaN;
% dive 378
[~,maxidx] = max(data660(378).pressure);
idx = find(data660(378).pressure > 233 & data660(378).pressure < 247);
idxidx = find(idx < maxidx);
data660(378).salinity(idx(idxidx)) = NaN;
% dive 380
[~,maxidx] = max(data660(380).pressure);
idx = find(data660(380).pressure < 70);
idxidx = find(idx < maxidx);
data660(380).salinity(idx(idxidx)) = NaN;
% dive 388
[~,maxidx] = max(data660(388).pressure);
idx = find(data660(388).pressure > 154 & data660(388).pressure < 162);
idxidx = find(idx > maxidx);
data660(388).salinity(idx(idxidx)) = NaN;
% dive 390
[~,maxidx] = max(data660(390).pressure);
idx = find(data660(390).pressure > 264 & data660(390).pressure < 276);
idxidx = find(idx < maxidx);
data660(390).salinity(idx(idxidx)) = NaN;
% dive 391
[~,idx] = max(data660(391).pressure);
data660(391).salinity(idx:end)= NaN;
% dive 392
[~,maxidx] = max(data660(392).pressure);
idx = find(data660(392).pressure > 260 & data660(392).pressure < 270);
idxidx = find(idx < maxidx);
data660(392).salinity(idx(idxidx)) = NaN;
% dive 407
[~,maxidx] = max(data660(407).pressure);
idx = find(data660(407).pressure > 150 & data660(407).pressure < 450);
idxidx = find(idx < maxidx);
data660(407).salinity(idx(idxidx)) = NaN;
idx = find(data660(407).pressure < 58);
idxidx = find(idx > maxidx);
data660(407).salinity(idx(idxidx)) = NaN;
% dive 409
[~,maxidx] = max(data660(409).pressure);
idx = find(data660(409).pressure > 425 & data660(409).pressure < 460);
idxidx = find(idx < maxidx);
data660(409).salinity(idx(idxidx)) = NaN;
% dive 411
[~,maxidx] = max(data660(411).pressure);
idx = find(data660(411).pressure > 400 & data660(411).pressure < 480);
idxidx = find(idx < maxidx);
data660(411).salinity(idx(idxidx)) = NaN;
% dive 412
idx = find(data660(412).pressure > 400 & data660(412).pressure < 420);
data660(412).salinity(idx) = NaN; %both bad
% dive 414
[~,maxidx] = max(data660(414).pressure);
idx = find(data660(414).pressure > 284 & data(414).pressure < 289);
idxidx = find(idx < maxidx);
data660(414).salinity(idx(idxidx)) = NaN;
% dive 417
[~,maxidx] = max(data660(417).pressure);
idx = find(data660(417).pressure > 288 & data(417).pressure < 294);
idxidx = find(idx > maxidx);
data660(417).salinity(idx(idxidx)) = NaN;
idx = find(data660(417).pressure > 310 & data(417).pressure < 325);
idxidx = find(idx < maxidx);
data660(417).salinity(idx(idxidx)) = NaN;
% dive 418
[~,maxidx] = max(data660(418).pressure);
idx = find(data660(418).pressure > 280 & data(418).pressure < 320);
idxidx = find(idx > maxidx);
data660(418).salinity(idx(idxidx)) = NaN;
idx = find(data660(418).pressure > 510 & data660(418).pressure < 860);
data660(418).salinity(idx) = NaN; % both bad
% dive 419
[~,maxidx] = max(data660(419).pressure);
idx = find(data660(419).pressure > 552 & data(419).pressure < 564);
idxidx = find(idx < maxidx);
data660(419).salinity(idx(idxidx)) = NaN;
idx = find(data660(419).pressure > 635 & data(419).pressure < 665);
idxidx = find(idx < maxidx);
data660(419).salinity(idx(idxidx)) = NaN;
% dive 420
[~,maxidx] = max(data660(420).pressure);
idx = find(data660(420).pressure > 456 & data(420).pressure < 461);
idxidx = find(idx < maxidx);
data660(420).salinity(idx(idxidx)) = NaN;
% dive 421
data660(421).salinity = NaN(length(data660(421).salinity),1);
data660(421).temperature = NaN(length(data660(421).temperature),1);
% dive 425
[~,maxidx] = max(data660(425).pressure);
idx = find(data(425).pressure < 100);
idxidx = find(idx < maxidx);
data660(425).salinity(idx(idxidx)) = NaN;
% dive 429
[~,maxidx] = max(data660(429).pressure);
idx = find(data660(429).pressure > 290 & data660(429).pressure < 315);
idxidx = find(idx < maxidx);
data660(429).salinity(idx(idxidx)) = NaN;
% dive 431
idx = find(data660(431).pressure > 180 & data660(431).pressure < 260);
data660(431).salinity(idx) = NaN; %both noisy
% dive 433
[~,maxidx] = max(data660(433).pressure);
idx = find(data660(433).pressure > 363 & data660(433).pressure < 368);
idxidx = find(idx > maxidx);
data660(433).salinity(idx(idxidx)) = NaN;
% dive 444
[~,maxidx] = max(data660(444).pressure);
idx = find(data660(444).pressure > 500 & data660(444).pressure < 520);
idxidx = find(idx > maxidx);
data660(444).salinity(idx(idxidx)) = NaN;
% dive 445
[~,maxidx] = max(data660(445).pressure);
idx = find(data660(445).pressure > 475 & data660(445).pressure < 485);
idxidx = find(idx < maxidx);
data660(445).salinity(idx(idxidx)) = NaN;
% dive 448
[~,maxidx] = max(data660(448).pressure);
idx = find(data660(448).pressure < 35);
idxidx = find(idx < maxidx);
data660(448).salinity(idx(idxidx)) = NaN;
% dive 453
[~,maxidx] = max(data660(453).pressure);
idx = find(data660(453).pressure > 360 & data660(453).pressure < 390);
idxidx = find(idx < maxidx);
data660(453).salinity(idx(idxidx)) = NaN;
% dive 456
idx = find(data660(456).pressure > 990);
data660(456).salinity(idx) = NaN;
data660(456).temperature(idx) = NaN;
idx = find(data660(456).pressure > 180 & data660(456).pressure < 205);
data660(456).salinity(idx) = NaN;
% dive 457
[~,maxidx] = max(data660(457).pressure);
idx = find(data660(457).pressure > 88.2 & data660(457).pressure < 88.5);
idxidx = find(idx > maxidx);
data660(457).salinity(idx(idxidx)) = NaN;
idx = find(data660(457).pressure > 185 & data660(457).pressure < 200);
idxidx = find(idx < maxidx);
data660(457).salinity(idx(idxidx)) = NaN;
idx = find(data660(457).pressure > 385 & data660(457).pressure < 390);
idxidx = find(idx > maxidx);
data660(457).salinity(idx(idxidx)) = NaN;
% dive 458
[~,maxidx] = max(data660(458).pressure);
idx = find(data660(458).pressure > 642 & data660(458).pressure < 652);
idxidx = find(idx > maxidx);
data660(458).salinity(idx(idxidx)) = NaN;
idx = find(data660(458).pressure > 390 & data660(458).pressure < 430);
idxidx = find(idx < maxidx);
data660(458).salinity(idx(idxidx)) = NaN;
% % dive 463
% idx = find(data660(463).pressure > 490 & data660(463).pressure < 500);
% data660(463).salinity(idx) = NaN;
% dive 464
[~,maxidx] = max(data660(464).pressure);
idx = find(data660(464).pressure < 100);
idxidx = find(idx < maxidx);
data660(464).salinity(idx(idxidx)) = NaN;
% dive 465
[~,maxidx] = max(data660(465).pressure);
idx = find(data660(465).pressure > 764 & data660(465).pressure < 780);
idxidx = find(idx > maxidx);
data660(465).salinity(idx(idxidx)) = NaN;
% % dive 468
% idx = find(data660(468).pressure > 445 & data660(468).pressure < 452);
% data660(468).salinity(idx) = NaN;
% dive 469
[~,maxidx] = max(data660(469).pressure);
idx = find(data660(469).pressure > 167 & data660(469).pressure < 173);
idxidx = find(idx < maxidx);
data660(469).salinity(idx(idxidx)) = NaN;
% dive 478
[~,maxidx] = max(data660(478).pressure);
idx = find(data660(478).pressure > 235 & data660(478).pressure < 255);
idxidx = find(idx > maxidx);
data660(478).salinity(idx(idxidx)) = NaN;
% dive 482
idx = find(data660(482).pressure > 306 & data660(482).pressure < 316);
data660(482).salinity(idx) = NaN; % both messy
% dive 483
[~,maxidx] = max(data660(483).pressure);
idx = find(data660(483).pressure > 145 & data660(483).pressure < 175);
idxidx = find(idx < maxidx);
data660(483).salinity(idx(idxidx)) = NaN;
idx = find(data660(483).pressure > 270 & data660(483).pressure < 330);
idxidx = find(idx < maxidx);
data660(483).salinity(idx(idxidx)) = NaN;
% dive 485
[~,maxidx] = max(data660(485).pressure);
idx = find(data660(485).pressure > 170 & data660(485).pressure < 205);
idxidx = find(idx < maxidx);
data660(485).salinity(idx(idxidx)) = NaN;
% dive 488
[~,maxidx] = max(data660(488).pressure);
idx = find(data660(488).pressure > 275 & data660(488).pressure < 280);
idxidx = find(idx < maxidx);
data660(488).salinity(idx(idxidx)) = NaN;
% dive 493
idx = find(data660(493).pressure < 50);
data660(493).salinity(idx) = NaN;
% dive 494
idx = find(data660(494).pressure < 120);
data660(494).salinity(idx) = NaN;
% dive 495
idx = find(data660(495).pressure < 80);
data660(495).salinity(idx) = NaN;
% dive 496
idx = find(data660(496).pressure < 40);
data660(496).salinity(idx) = NaN;
% dive 499
[~,maxidx] = max(data660(499).pressure);
idx = find(data660(499).pressure > 310 & data660(499).pressure < 340);
idxidx = find(idx < maxidx);
data660(499).salinity(idx(idxidx)) = NaN;
% dive 503
[~,maxidx] = max(data660(503).pressure);
idx = find(data660(503).pressure > 255 & data660(503).pressure < 285);
idxidx = find(idx < maxidx);
data660(503).salinity(idx(idxidx)) = NaN;
% dive 504
[~,maxidx] = max(data660(504).pressure);
idx = find(data660(504).pressure > 195 & data660(504).pressure < 203);
idxidx = find(idx < maxidx);
data660(504).salinity(idx(idxidx)) = NaN;








