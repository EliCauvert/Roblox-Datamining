local sessionTypeModule = require(script.Parent.SessionType)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	
	if p1 then
		tbl._sessionService = p1
	else
		tbl._sessionService = game:GetService("SessionService")
	end
	tbl._currentMenuTab = nil
	
	return tbl
end

function t:_setMetadata(p1, p2, p3)
	self._sessionService:SetMetadata(p1, p2, p3)
end

function t:OpenExperienceMenu(p1)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(sessionTypeModule.StructuralIdentifier.Level2a, sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.Tag.level3.ExperienceMenu)
	
	if p1 then
		for i, v in pairs(p1) do
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

function t:OpenPeopleTab(p2, p3)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p2 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.PeopleTab, sessionTypeModule.Tag.level3.PeopleTab)
	
	if p3 then
		for i, v in pairs(p3) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.PeopleTab, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.PeopleTab
end

function t:OpenSettingsTab(p4, p5)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p4 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.SettingsTab, sessionTypeModule.Tag.level3.SettingsTab)
	
	if p5 then
		for i, v in pairs(p5) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.SettingsTab, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.SettingsTab
end

function t:OpenCapturesTab(p6, p7)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p6 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.CapturesTab, sessionTypeModule.Tag.level3.CapturesTab)
	
	if p7 then
		for i, v in pairs(p7) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.CapturesTab, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.CapturesTab
end

function t:OpenReportTab(p8, p9)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p8 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.ReportTab, sessionTypeModule.Tag.level3.ReportTab)
	
	if p9 then
		for i, v in pairs(p9) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.ReportTab, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.ReportTab
end

function t:OpenHelpTab(p10, p11)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p10 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.HelpTab, sessionTypeModule.Tag.level3.HelpTab)
	
	if p11 then
		for i, v in pairs(p11) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.HelpTab, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.HelpTab
end

function t:OpenLeaveExperience(p12, p13)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p12 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.LeaveExperience, sessionTypeModule.Tag.level3.LeaveExperience)
	
	if p13 then
		for i, v in pairs(p13) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.LeaveExperience, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.LeaveExperience
end

function t:OpenResetCharacter(p14, p15)
	-- upvalues: sessionTypeModule (ref)
	self._sessionService:SetSession(p14 or sessionTypeModule.StructuralIdentifier.ExperienceMenu, sessionTypeModule.StructuralIdentifier.ResetCharacter, sessionTypeModule.Tag.level3.ResetCharacter)
	
	if p15 then
		for i, v in pairs(p15) do
			self._sessionService:SetMetadata(sessionTypeModule.StructuralIdentifier.ResetCharacter, i, v)
		end
	end
	self._currentMenuTab = sessionTypeModule.StructuralIdentifier.ResetCharacter
end

function t:MenuSwitchToPage(p16)
	if p16 == nil then return end
	self:CloseOpenedMenuTab()
	local name = p16.Name
	
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