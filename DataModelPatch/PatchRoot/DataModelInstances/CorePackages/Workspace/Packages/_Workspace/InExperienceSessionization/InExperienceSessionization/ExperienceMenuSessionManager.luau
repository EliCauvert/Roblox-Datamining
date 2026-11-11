local SessionTypeModule = require(script.Parent.SessionType)
local ExperienceMenuSessionManager = {}
ExperienceMenuSessionManager.__index = ExperienceMenuSessionManager

function ExperienceMenuSessionManager.new(_sessionService)
	-- upvalues: ExperienceMenuSessionManager (copy)
	local self = setmetatable({}, ExperienceMenuSessionManager)
	
	if _sessionService then
		self._sessionService = _sessionService
	else
		self._sessionService = game:GetService("SessionService")
	end
	self._currentMenuTab = nil
	
	return self
end

function ExperienceMenuSessionManager:_setMetadata(p1, p2, p3)
	self._sessionService:SetMetadata(p1, p2, p3)
end

function ExperienceMenuSessionManager:OpenExperienceMenu(List)
	-- upvalues: SessionTypeModule (copy)
	self._sessionService:SetSession(SessionTypeModule.StructuralIdentifier.Level2a, SessionTypeModule.StructuralIdentifier.ExperienceMenu, SessionTypeModule.Tag.level3.ExperienceMenu)
	
	if List then
		for i, value in pairs(List) do
			self._sessionService:SetMetadata(SessionTypeModule.StructuralIdentifier.ExperienceMenu, i, value)
		end
	end
end

function ExperienceMenuSessionManager:CloseExperienceMenu()
	-- upvalues: SessionTypeModule (copy)
	self:CloseOpenedMenuTab()
	self._sessionService:RemoveSession(SessionTypeModule.StructuralIdentifier.ExperienceMenu)
end

function ExperienceMenuSessionManager:CloseOpenedMenuTab()
	if self._currentMenuTab then
		self._sessionService:RemoveSession(self._currentMenuTab)
		self._currentMenuTab = nil
	end
end

function ExperienceMenuSessionManager:OpenPeopleTab(p1, List)
	-- upvalues: SessionTypeModule (copy)
	self._sessionService:SetSession(if p1 then p1 else SessionTypeModule.StructuralIdentifier.ExperienceMenu, SessionTypeModule.StructuralIdentifier.PeopleTab, SessionTypeModule.Tag.level3.PeopleTab)
	
	if List then
		for i, value in pairs(List) do
			self._sessionService:SetMetadata(SessionTypeModule.StructuralIdentifier.PeopleTab, i, value)
		end
	end
	self._currentMenuTab = SessionTypeModule.StructuralIdentifier.PeopleTab
end

function ExperienceMenuSessionManager:OpenSettingsTab(p2, List)
	-- upvalues: SessionTypeModule (copy)
	self._sessionService:SetSession(if p2 then p2 else SessionTypeModule.StructuralIdentifier.ExperienceMenu, SessionTypeModule.StructuralIdentifier.SettingsTab, SessionTypeModule.Tag.level3.SettingsTab)
	
	if List then
		for i, value in pairs(List) do
			self._sessionService:SetMetadata(SessionTypeModule.StructuralIdentifier.SettingsTab, i, value)
		end
	end
	self._currentMenuTab = SessionTypeModule.StructuralIdentifier.SettingsTab
end

function ExperienceMenuSessionManager:OpenCapturesTab(p3, List)
	-- upvalues: SessionTypeModule (copy)
	self._sessionService:SetSession(if p3 then p3 else SessionTypeModule.StructuralIdentifier.ExperienceMenu, SessionTypeModule.StructuralIdentifier.CapturesTab, SessionTypeModule.Tag.level3.CapturesTab)
	
	if List then
		for i, value in pairs(List) do
			self._sessionService:SetMetadata(SessionTypeModule.StructuralIdentifier.CapturesTab, i, value)
		end
	end
	self._currentMenuTab = SessionTypeModule.StructuralIdentifier.CapturesTab
end

function ExperienceMenuSessionManager:OpenReportTab(p4, List)
	-- upvalues: SessionTypeModule (copy)
	self._sessionService:SetSession(if p4 then p4 else SessionTypeModule.StructuralIdentifier.ExperienceMenu, SessionTypeModule.StructuralIdentifier.ReportTab, SessionTypeModule.Tag.level3.ReportTab)
	
	if List then
		for i, value in pairs(List) do
			self._sessionService:SetMetadata(SessionTypeModule.StructuralIdentifier.ReportTab, i, value)
		end
	end
	self._currentMenuTab = SessionTypeModule.StructuralIdentifier.ReportTab
end

function ExperienceMenuSessionManager:OpenHelpTab(p5, List)
	-- upvalues: SessionTypeModule (copy)
	self._sessionService:SetSession(if p5 then p5 else SessionTypeModule.StructuralIdentifier.ExperienceMenu, SessionTypeModule.StructuralIdentifier.HelpTab, SessionTypeModule.Tag.level3.HelpTab)
	
	if List then
		for i, value in pairs(List) do
			self._sessionService:SetMetadata(SessionTypeModule.StructuralIdentifier.HelpTab, i, value)
		end
	end
	self._currentMenuTab = SessionTypeModule.StructuralIdentifier.HelpTab
end

function ExperienceMenuSessionManager:OpenLeaveExperience(p6, List)
	-- upvalues: SessionTypeModule (copy)
	self._sessionService:SetSession(if p6 then p6 else SessionTypeModule.StructuralIdentifier.ExperienceMenu, SessionTypeModule.StructuralIdentifier.LeaveExperience, SessionTypeModule.Tag.level3.LeaveExperience)
	
	if List then
		for i, value in pairs(List) do
			self._sessionService:SetMetadata(SessionTypeModule.StructuralIdentifier.LeaveExperience, i, value)
		end
	end
	self._currentMenuTab = SessionTypeModule.StructuralIdentifier.LeaveExperience
end

function ExperienceMenuSessionManager:OpenResetCharacter(p7, List)
	-- upvalues: SessionTypeModule (copy)
	self._sessionService:SetSession(if p7 then p7 else SessionTypeModule.StructuralIdentifier.ExperienceMenu, SessionTypeModule.StructuralIdentifier.ResetCharacter, SessionTypeModule.Tag.level3.ResetCharacter)
	
	if List then
		for i, value in pairs(List) do
			self._sessionService:SetMetadata(SessionTypeModule.StructuralIdentifier.ResetCharacter, i, value)
		end
	end
	self._currentMenuTab = SessionTypeModule.StructuralIdentifier.ResetCharacter
end

function ExperienceMenuSessionManager:MenuSwitchToPage(p8)
	if p8 == nil then return end
	self:CloseOpenedMenuTab()
	local Name = p8.Name
	
	if Name == "Players" then
		self:OpenPeopleTab()
		
		return
	end
	if Name == "Page" then
		self:OpenSettingsTab()
		
		return
	end
	if Name == "Captures" then
		self:OpenCapturesTab()
		
		return
	end
	if Name == "ReportAbuseMenuNewContainerPage" then
		self:OpenReportTab()
		
		return
	end
	if Name == "Help" then
		self:OpenHelpTab()
		
		return
	end
	if Name == "LeaveGamePage" then
		self:OpenLeaveExperience()
		
		return
	end
	if Name == "ResetCharacter" then
		self:OpenResetCharacter()
	end
end

return ExperienceMenuSessionManager