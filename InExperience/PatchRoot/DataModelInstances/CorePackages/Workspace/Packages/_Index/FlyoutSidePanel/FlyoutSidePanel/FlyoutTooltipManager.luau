local appStorageService = game:GetService("AppStorageService")
local IAFlyoutTooltipMaxShownCount = game:DefineFastInt("IAFlyoutTooltipMaxShownCount", 5)
local IAFlyoutDailyTooltipMaxShownCount = game:DefineFastInt("IAFlyoutDailyTooltipMaxShownCount", 3)
local t = {}
t.__index = t

local function _(p0, p1)
	local dateString = os.date("*t", p0)
	local dateString_1 = os.date("*t", p1)
	
	return dateString.year == dateString_1.year and (dateString.month == dateString_1.month and dateString.day == dateString_1.day)
end

local function readStorage()
	-- upvalues: appStorageService (ref)
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("IAFlyoutEntryPointTooltip")
	end)
	
	if ok and status then
		if status == "FLYOUT_OPENED" then
			return 0, 0, 0
		elseif string.find(status, ",") then
			local match, match_1, match_2 = string.match(status, "(%d+),(%d+),(%d+)")
			local var10 = tonumber(match) or 0
			local var11 = tonumber(match_1) or 0
			local var12 = tonumber(match_2)
			
			if var12 then
				return var10, var11, var12
			end
		end
	end
	return 0, 0, 0
end

function t.new()
	-- upvalues: t (ref)
	return setmetatable({
		_hasChecked = false,
		_dailyCount = 0,
		_totalCount = 0,
		_getTime = function()
			return os.time()
		end
	}, t)
end

function t:setTimeProvider(p2)
	self._getTime = p2
end

function t:flyoutSidePanelOpened()
	-- upvalues: IAFlyoutTooltipMaxShownCount (ref), appStorageService (ref)
	if self._dailyCount < IAFlyoutTooltipMaxShownCount then
		self._dailyCount = IAFlyoutTooltipMaxShownCount
		appStorageService:SetItem("IAFlyoutEntryPointTooltip", string.format("%d,%d,%d", self:_getTime(), self._dailyCount, self._totalCount))
		appStorageService:Flush()
	end
end

function t:getTooltipCount()
	return self._totalCount
end

function t:tooltipSeenTimeHelper(p3)
	-- upvalues: IAFlyoutDailyTooltipMaxShownCount (ref), IAFlyoutTooltipMaxShownCount (ref)
	local dateString = os.date("*t", self:_getTime())
	local dateString_1 = os.date("*t", p3)
	
	if not (dateString.year == dateString_1.year and (dateString.month == dateString_1.month and dateString.day == dateString_1.day)) then
		self._dailyCount = 0
	end
	return self._dailyCount < IAFlyoutDailyTooltipMaxShownCount and self._totalCount < IAFlyoutTooltipMaxShownCount
end

function t:updateTooltipAppStorageValue()
	-- upvalues: appStorageService (ref)
	self._dailyCount += 1
	self._totalCount += 1
	appStorageService:SetItem("IAFlyoutEntryPointTooltip", string.format("%d,%d,%d", self:_getTime(), self._dailyCount, self._totalCount))
	appStorageService:Flush()
end

function t:isTooltipActive()
	-- upvalues: readStorage (ref), IAFlyoutTooltipMaxShownCount (ref)
	if self._hasChecked then
		return false
	end
	self._hasChecked = true
	local _ = 0
	local var15, var16, var17 = readStorage()
	self._dailyCount = var16
	self._totalCount = var17
	
	if IAFlyoutTooltipMaxShownCount <= self._dailyCount or IAFlyoutTooltipMaxShownCount <= self._totalCount then
		return false
	elseif self:tooltipSeenTimeHelper(var15) then
		self:updateTooltipAppStorageValue()
		
		return true
	end
	return false
end

return t.new()