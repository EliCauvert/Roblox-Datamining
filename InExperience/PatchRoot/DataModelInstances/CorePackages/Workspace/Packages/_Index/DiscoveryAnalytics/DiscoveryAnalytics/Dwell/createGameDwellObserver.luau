local DiscoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local CalculateRowPositionFieldsFunction = require(DiscoveryAnalytics.Parent.UnifiedLogging).calculateRowPositionFields
local DwellTrackerModule = require(script.Parent.DwellTracker)
local GameDwellItemModule = require(script.Parent.GameDwellItem)
local BuildGameDwellEventModule = require(script.Parent.buildGameDwellEvent)
local SendGameDwellEventModule = require(DiscoveryAnalytics.Events.sendGameDwellEvent)

local function itemFromAnalytics(p1, Cell, ItemData)
	-- upvalues: CalculateRowPositionFieldsFunction (copy)
	if type(ItemData) ~= "table" then
		return nil
	end
	local Number: number? = tonumber(ItemData.universeId)
	
	if Number and Number > 0 and ItemData.tileType ~= "Blank" then
		local RowPositionFields = CalculateRowPositionFieldsFunction(Cell, p1.itemsPerRow, p1.startRowNumber)
		local Number1: number? = tonumber(ItemData.topicContentsIndex)
		local AdFlag: string = ItemData.adFlag
		local IsAdFlag: boolean = AdFlag == true or (AdFlag == 1 or type(AdFlag) == "string" and (AdFlag:lower() == "true" or AdFlag:lower() == "t"))
		
		return {
			universeId = Number,
			cell = Cell,
			rank = if Number1 and Number1 > 0 and Number1 % 1 == 0 then Number1 else -1,
			row = RowPositionFields.rowInSort,
			rowOnPage = RowPositionFields.rowOnPage,
			positionInRow = RowPositionFields.positionInRow,
			componentType = tostring(ItemData.itemComponentType or (ItemData.componentType or "unknown")),
			adFlag = if IsAdFlag then 1 else 0,
			adId = if IsAdFlag then tostring(ItemData.adId or "0") else "0"
		}
	else
		return nil
	end
end

return function(p1)
	-- upvalues: itemFromAnalytics (copy), GameDwellItemModule (copy), SendGameDwellEventModule (copy), BuildGameDwellEventModule (copy), DwellTrackerModule (copy)
	local v1 = nil
	
	local function _(p2)
		-- upvalues: v1 (ref)
		local v2 = v1
		
		if not v2 then return end
		v1 = nil
		
		for _, connection in v2.connections do
			connection:Disconnect()
		end
		v2.tracker.close(p2 or "collectionReplaced")
	end
	
	local function createTracker(p3, p4: number)
		-- upvalues: p1 (copy), itemFromAnalytics (upval), GameDwellItemModule (upval), SendGameDwellEventModule (upval), BuildGameDwellEventModule (upval), DwellTrackerModule (upval)
		local config = {
			measurementVersion = 1,
			gameSetTypeId = tostring(p3.collectionId),
			sortPos = tonumber(p3.collectionPosition) or -1,
			collectionComponentType = tostring(p3.collectionComponentType or "unknown"),
			scanDebounceMs = math.floor(p4 * 1000)
		}
		
		if p1.collectionItemSize then
			config.collectionItemSize = p1.collectionItemSize
		end
		local HttpService = game:GetService("HttpService")
		
		return DwellTrackerModule.new({
			now = function(): number
				return (math.floor(os.clock() * 1000))
			end,
			wallNow = function()
				return DateTime.now().UnixTimestampMillis
			end,
			newUuid = function()
				-- upvalues: HttpService (copy)
				return HttpService:GenerateGUID(false)
			end,
			getItem = function(Cell)
				-- upvalues: itemFromAnalytics (upval), p3 (copy), p1 (upval)
				return (itemFromAnalytics(p3, Cell, p1.getItemData(Cell)))
			end,
			identity = GameDwellItemModule.identity,
			sendStarts = function(p5)
				-- upvalues: SendGameDwellEventModule (upval), BuildGameDwellEventModule (upval), config (copy), p1 (upval)
				SendGameDwellEventModule("gameDwellStart", BuildGameDwellEventModule.starts(config, p5), p1.pageContext)
			end,
			sendEnds = function(p5)
				-- upvalues: SendGameDwellEventModule (upval), BuildGameDwellEventModule (upval), config (copy), p1 (upval)
				SendGameDwellEventModule("gameDwellEnd", BuildGameDwellEventModule.ends(config, p5), p1.pageContext)
			end
		})
	end
	
	return {
		attach = function(Callback, p3)
			-- upvalues: v1 (ref), p1 (copy), createTracker (copy)
			local v3 = v1
			
			if v3 then
				v1 = nil
				
				for _, connection in v3.connections do
					connection:Disconnect()
				end
				v3.tracker.close("collectionReplaced")
			end
			local CollectionData = p1.getCollectionData()
			local CollectionId = if type(CollectionData) == "table" then CollectionData.collectionId else nil
			
			if CollectionId == nil or CollectionId == -1 then
				return function() end
			else
				local config = {
					blocked = {},
					connections = {},
					tracker = createTracker(table.clone(CollectionData), p3)
				}
				v1 = config
				
				local function _(p4, IsBlockedEntry)
					-- upvalues: v1 (upval), config (copy), Callback (copy)
					if v1 ~= config or config.blocked[p4] == true == IsBlockedEntry then return end
					config.blocked[p4] = if IsBlockedEntry then true else nil
					
					if IsBlockedEntry then
						config.tracker.close(p4)
						
						return
					end
					if next(config.blocked) == nil then
						Callback()
					end
				end
				
				local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
				local ExperienceService = game:GetService("ExperienceService")
				config.connections = {
					AppLifecycleObserverService.OnHide:Connect(function()
						-- upvalues: v1 (upval), config (copy)
						if v1 == config then
							if config.blocked.background == true then return end
							config.blocked.background = true
							config.tracker.close("background")
						end
					end),
					AppLifecycleObserverService.OnUnhide:Connect(function()
						-- upvalues: v1 (upval), config (copy), Callback (copy)
						if v1 == config then
							if config.blocked.background ~= true then return end
							config.blocked.background = nil
							
							if next(config.blocked) == nil then
								Callback()
							end
						end
					end),
					ExperienceService:RegisterForExperienceJoin(function()
						-- upvalues: v1 (upval), config (copy)
						if v1 == config then
							if config.blocked.experience == true then return end
							config.blocked.experience = true
							config.tracker.close("experience")
						end
					end),
					ExperienceService:RegisterForExperienceLeave(function()
						-- upvalues: v1 (upval), config (copy), Callback (copy)
						if v1 == config then
							if config.blocked.experience ~= true then return end
							config.blocked.experience = nil
							
							if next(config.blocked) == nil then
								Callback()
							end
						end
					end)
				}
				
				return function(p4)
					-- upvalues: v1 (upval), config (copy)
					if v1 == config then
						local v4 = v1
						
						if not v4 then return end
						v1 = nil
						
						for _, connection in v4.connections do
							connection:Disconnect()
						end
						v4.tracker.close(p4 or "collectionReplaced")
					end
				end
			end
		end,
		sample = function(p4, p5)
			-- upvalues: v1 (ref)
			local v4 = v1
			
			if not v4 then return end
			if not p5 then
				v4.tracker.close("detectorUnavailable")
				
				return
			end
			if next(v4.blocked) == nil then
				v4.tracker.sample(p4)
			end
		end,
		focusChanged = function(p4)
			-- upvalues: v1 (ref)
			local v4 = v1
			
			if v4 and not p4 then
				v4.tracker.close("navigation")
			end
		end
	}
end