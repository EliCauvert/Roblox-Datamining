local AppStorageService = game:GetService("AppStorageService")
local IAFlyoutTooltipMaxShownCount = game:DefineFastInt("IAFlyoutTooltipMaxShownCount", 5)
local IAFlyoutDailyTooltipMaxShownCount = game:DefineFastInt("IAFlyoutDailyTooltipMaxShownCount", 3)
local Module = {}
Module.__index = Module

local function _(p1, p2): boolean
	local DateInfo = os.date("*t", p1)
	local DateInfo1 = os.date("*t", p2)
	
	return DateInfo.year == DateInfo1.year and DateInfo.month == DateInfo1.month and DateInfo.day == DateInfo1.day
end

local function readStorage()
	-- upvalues: AppStorageService (copy)
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("IAFlyoutEntryPointTooltip")
	end)
	
	if Success and Result then
		if Result == "FLYOUT_OPENED" then
			return 0, 0, 0
		end
		if string.find(Result, ",") then
			local Match, Match2, Match3 = string.match(Result, "(%d+),(%d+),(%d+)")
			local Number: number = tonumber(Match) or 0
			local Number1: number = tonumber(Match2) or 0
			local Number2: number? = tonumber(Match3)
			
			if Number2 then
				return Number, Number1, Number2
			end
		end
	end
	return 0, 0, 0
end

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({
		_hasChecked = false,
		_dailyCount = 0,
		_totalCount = 0,
		_getTime = function(): number
			return os.time()
		end
	}, Module))
end

function Module:setTimeProvider(_getTime)
	self._getTime = _getTime
end

function Module:flyoutSidePanelOpened()
	-- upvalues: IAFlyoutTooltipMaxShownCount (copy), AppStorageService (copy)
	if self._dailyCount < IAFlyoutTooltipMaxShownCount then
		self._dailyCount = IAFlyoutTooltipMaxShownCount
		AppStorageService:SetItem("IAFlyoutEntryPointTooltip", (string.format("%d,%d,%d", self:_getTime(), self._dailyCount, self._totalCount)))
		AppStorageService:Flush()
	end
end

function Module:getTooltipCount()
	return self._totalCount
end

function Module:tooltipSeenTimeHelper(p1): boolean
	-- upvalues: IAFlyoutDailyTooltipMaxShownCount (copy), IAFlyoutTooltipMaxShownCount (copy)
	local DateInfo = os.date("*t", (self:_getTime()))
	local DateInfo1 = os.date("*t", p1)
	
	if DateInfo.year ~= DateInfo1.year or (DateInfo.month ~= DateInfo1.month or DateInfo.day ~= DateInfo1.day) then
		self._dailyCount = 0
	end
	return self._dailyCount < IAFlyoutDailyTooltipMaxShownCount and self._totalCount < IAFlyoutTooltipMaxShownCount
end

function Module:updateTooltipAppStorageValue()
	-- upvalues: AppStorageService (copy)
	self._dailyCount += 1
	self._totalCount += 1
	AppStorageService:SetItem("IAFlyoutEntryPointTooltip", (string.format("%d,%d,%d", self:_getTime(), self._dailyCount, self._totalCount)))
	AppStorageService:Flush()
end

function Module:isTooltipActive(): boolean
	-- upvalues: readStorage (copy), IAFlyoutTooltipMaxShownCount (copy)
	if self._hasChecked then
		return false
	end
	self._hasChecked = true
	local Storage, Storage2, Storage3 = readStorage()
	self._dailyCount = Storage2
	self._totalCount = Storage3
	
	if IAFlyoutTooltipMaxShownCount <= self._dailyCount or IAFlyoutTooltipMaxShownCount <= self._totalCount then
		return false
	elseif self:tooltipSeenTimeHelper(Storage) then
		self:updateTooltipAppStorageValue()
		
		return true
	else
		return false
	end
end

return Module.new()