local sessionTypeModule = require(script.Parent.SessionType)
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	
	if p0 then
		tbl._sessionService = p0
	else
		tbl._sessionService = game:GetService("SessionService")
	end
	tbl._currentMenuTab = nil
	
	return tbl
end

function t:_setMetadata(p1, p2, p3)
	self._sessionService:SetMetadata(p1, p2, p3)
end

function t:OpenExperienceMenu(p4)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(sessionTypeModule.StructuralIdentifier.Level2a, sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.Tag.level3.ExperienceMenu)
	
	if p4 then
		for i, v in pairs(p4) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.ExperienceMenu, i, v)
		end
	end
end

function t:CloseExperienceMenu()
	-- upvalues: sessionTypeModule (ref)
	self:CloseOpenedMenuTab()
	self._sessionService:RemoveSession(sessionTypeModule.StructuralIdentifier.ExperienceMenu)
end

function t:CloseOpenedMenuTab()
	if self._currentMenuTab then
		self._sessionService:RemoveSession(self._currentMenuTab)
		self._currentMenuTab = nil
	end
end

function t:OpenPeopleTab(p5, p6)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p5 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.PeopleTab, sessionTypeModule.Tag.level3.PeopleTab)
	
	if p6 then
		for i, v in pairs(p6) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.PeopleTab, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.PeopleTab
end

function t:OpenSettingsTab(p7, p8)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p7 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.SettingsTab, sessionTypeModule.Tag.level3.SettingsTab)
	
	if p8 then
		for i, v in pairs(p8) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.SettingsTab, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.SettingsTab
end

function t:OpenCapturesTab(p9, p10)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p9 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.CapturesTab, sessionTypeModule.Tag.level3.CapturesTab)
	
	if p10 then
		for i, v in pairs(p10) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.CapturesTab, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.CapturesTab
end

function t:OpenReportTab(p11, p12)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p11 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.ReportTab, sessionTypeModule.Tag.level3.ReportTab)
	
	if p12 then
		for i, v in pairs(p12) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.ReportTab, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.ReportTab
end

function t:OpenHelpTab(p13, p14)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p13 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.HelpTab, sessionTypeModule.Tag.level3.HelpTab)
	
	if p14 then
		for i, v in pairs(p14) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.HelpTab, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.HelpTab
end

function t:OpenLeaveExperience(p15, p16)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p15 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.LeaveExperience, sessionTypeModule.Tag.level3.LeaveExperience)
	
	if p16 then
		for i, v in pairs(p16) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.LeaveExperience, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.LeaveExperience
end

function t:OpenResetCharacter(p17, p18)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p17 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.ResetCharacter, sessionTypeModule.Tag.level3.ResetCharacter)
	
	if p18 then
		for i, v in pairs(p18) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.ResetCharacter, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.ResetCharacter
end

function t:MenuSwitchToPage(p19)
	if p19 == nil then return end
	self:CloseOpenedMenuTab()
	local name = p19.Name
	
	if name == "Players" then
		self:OpenPeopleTab()
		
		return
	elseif name == "Page" then
		self:OpenSettingsTab()
		
		return
	elseif name == "Captures" then
		self:OpenCapturesTab()
		
		return
	elseif name == "ReportAbuseMenuNewContainerPage" then
		self:OpenReportTab()
		
		return
	elseif name == "Help" then
		self:OpenHelpTab()
		
		return
	elseif name == "LeaveGamePage" then
		self:OpenLeaveExperience()
		
		return
	elseif name == "ResetCharacter" then
		self:OpenResetCharacter()
	end
end

return t