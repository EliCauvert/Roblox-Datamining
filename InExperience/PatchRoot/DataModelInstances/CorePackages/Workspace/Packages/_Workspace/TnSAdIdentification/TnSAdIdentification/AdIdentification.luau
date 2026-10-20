local AdService = game:GetService("AdService")
local Players = game:GetService("Players")
local TnSAdIdentification = script:FindFirstAncestor("TnSAdIdentification")
local GetFIntAdIdentifiedTelemetryThrottleHundredthsPercentModule = require(TnSAdIdentification.Flags.GetFIntAdIdentifiedTelemetryThrottleHundredthsPercent)
local Parent = TnSAdIdentification.Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local Default = LoggingProtocolModule.default
local IdentificationUtils = require(Parent.AvatarIdentification).IdentificationUtils
local Largest = math.max(require(TnSAdIdentification.Flags.GetFIntAdIdentificationMinimumAreaPerMyriad)() / 10000, 0)

function getLocalCharacterPosition(Object)
	local HumanoidRootPart = Object:FindFirstChild("HumanoidRootPart")
	
	return if HumanoidRootPart then HumanoidRootPart.Position else nil
end

function checkVisibility(Camera: Camera, p1, Entry, FilterDescendantsInstances): number
	local Position = Camera.CFrame.Position
	local ViewportSize = Camera.ViewportSize
	local RaycastParams1 = RaycastParams.new()
	RaycastParams1.FilterType = Enum.RaycastFilterType.Exclude
	RaycastParams1.FilterDescendantsInstances = FilterDescendantsInstances
	RaycastParams1.IgnoreWater = true
	local Count = 0
	local Count1 = 0
	local EntryDelta = Entry[2] - Entry[1]
	local EntryDelta1 = Entry[3] - Entry[1]
	
	for i = 1, 4 do
		local EntryDeltaRatio = EntryDelta * (i - 0.5) / 4
		
		for i1 = 1, 4 do
			local NewEntry = Entry[1] + EntryDeltaRatio + EntryDelta1 * (i1 - 0.5) / 4
			local NewEntryDelta = NewEntry - Position
			Count += 1
			local ViewportPosition, _ = Camera:WorldToViewportPoint(NewEntry)
			
			if ViewportPosition.Z >= 0 and ViewportPosition.X >= 0 and ViewportPosition.Y >= 0 and ViewportSize.X >= ViewportPosition.X and ViewportSize.Y >= ViewportPosition.Y then
				local RaycastResult = workspace:Raycast(Position, NewEntryDelta * 1.1, RaycastParams1)
				
				if RaycastResult and RaycastResult.Instance == p1 then
					Count1 += 1
				end
			end
		end
	end
	return Count1 / Count
end

function createSingleVisibleRegionFromWorldSpaceCorners(List, p2, p3)
	-- upvalues: IdentificationUtils (copy)
	local Buffer = table.create(#List)
	
	for i, value in ipairs(List) do
		local WorldToFullViewportPointNormalizedResult, _, _ = IdentificationUtils.worldToFullViewportPointNormalized(value, p2, p3)
		Buffer[i] = Vector2.new(WorldToFullViewportPointNormalizedResult.X, WorldToFullViewportPointNormalizedResult.Y)
	end
	return {
		id = 1,
		convexHull = { Buffer[1], Buffer[2], Buffer[4], Buffer[3] }
	}
end

function getAdCenterAndScreenArea(List, Camera: Camera)
	local ViewportSize = Camera.ViewportSize
	local Total = vector.create(0, 0, 0)
	local v1 = 0
	local List1 = {}
	
	for _, Position in ipairs(List) do
		Total += Position
		local ViewportPosition, _ = Camera:WorldToViewportPoint(Position)
		table.insert(List1, Vector2.new(ViewportPosition.X, ViewportPosition.Y) / ViewportSize)
	end
	return Total / 4, (v1 + math.abs(((List1[2] - List1[1]):Cross(List1[3] - List1[1]))) + math.abs(((List1[2] - List1[4]):Cross(List1[3] - List1[4])))) / 2
end

return {
	getAdsForPoint = function(List, Vector)
		local t = {}
		
		for i, value in pairs(List) do
			local BoundingBox = value.boundingBox
			
			if Vector.X >= BoundingBox.min.X and Vector.Y >= BoundingBox.min.Y and BoundingBox.max.X >= Vector.X and BoundingBox.max.Y >= Vector.Y then
				for _, visibleRegion in ipairs(value.visibleRegions) do
					local ConvexHull = visibleRegion.convexHull
					
					if #ConvexHull >= 3 then
						local ConvexHullEntry = ConvexHull[#ConvexHull]
						local v2 = true
						local v3 = true
						
						for _, value1 in ipairs(ConvexHull) do
							local CrossProduct: number = (value1 - ConvexHullEntry):Cross(Vector - ConvexHullEntry)
							v3 = v3 and CrossProduct <= 0
							v2 = v2 and CrossProduct >= 0
							ConvexHullEntry = value1
						end
						if v2 or v3 then
							t[i] = value
							break
						end
					end
				end
			end
		end
		return t
	end,
	getVisibleAds = function()
		-- upvalues: AdService (copy), Players (copy), IdentificationUtils (copy), Largest (copy), Default (copy), LoggingProtocolModule (copy), GetFIntAdIdentifiedTelemetryThrottleHundredthsPercentModule (copy)
		local t = {}
		local config = { totalAds = 0, checkedAds = 0, duration = 0 }
		local ReportAdInfo = AdService:GetReportAdInfo()
		local CurrentCamera = workspace.CurrentCamera
		
		if not CurrentCamera then
			return t, config
		end
		local LocalPlayer = Players.LocalPlayer
		
		if not LocalPlayer then
			return t, config
		end
		local Character = LocalPlayer.Character
		local t1 = {}
		local LocalCharacterPosition = Character and getLocalCharacterPosition(Character) or CurrentCamera.CFrame.Position
		local ViewportInfo = IdentificationUtils.getViewportInfo()
		config.viewportInfo = ViewportInfo
		local ClockTime = os.clock()
		config.totalAds = #ReportAdInfo
		
		local function _()
			-- upvalues: config (copy), ClockTime (copy)
			config.duration = os.clock() - ClockTime
			
			return config
		end
		
		local _ = function(): boolean
			-- upvalues: ClockTime (copy)
			return os.clock() - ClockTime > 0.2
		end
		
		local Count = 1
		
		for _, value in ipairs(ReportAdInfo) do
			if os.clock() - ClockTime > 0.2 then
				config.duration = os.clock() - ClockTime
				
				return t, config
			end
			local BasePart = value.basePart
			local AdUnitName = value.adUnitName
			local AssetId = value.assetId
			local EncryptedAdTrackingData = value.encryptedAdTrackingData
			local EncryptionMetadata = value.encryptionMetadata
			
			if EncryptedAdTrackingData == "" or EncryptionMetadata == "" or AssetId == "11307989327" then
				config.checkedAds += 1
			else
				local AssetCorners = value.assetCorners
				
				if AssetCorners and #AssetCorners >= 4 then
					local AdCenterAndScreenArea, AdCenterAndScreenArea2 = getAdCenterAndScreenArea(AssetCorners, CurrentCamera)
					local Distance = (AdCenterAndScreenArea - LocalCharacterPosition).Magnitude
					
					if (AdCenterAndScreenArea - CurrentCamera.CFrame.Position):Dot(CurrentCamera.CFrame.LookVector) < 0 then
						config.checkedAds += 1
					else
						local Direction = (AssetCorners[1] - AssetCorners[2]):Cross(AssetCorners[1] - AssetCorners[3]).Unit
						
						if Direction:Dot(AdCenterAndScreenArea - BasePart.Position) < 0 then
							Direction = -Direction
						end
						if (CurrentCamera.CFrame.Position - AdCenterAndScreenArea):Dot(Direction) < 0 then
							config.checkedAds += 1
						else
							local ViewportCorners, ViewportCorners2 = IdentificationUtils.getViewportCorners(AssetCorners, CurrentCamera, ViewportInfo)
							
							if ViewportCorners == IdentificationUtils.defaultMin then
								config.checkedAds += 1
							elseif AdCenterAndScreenArea2 < Largest then
								config.checkedAds += 1
							else
								local CheckVisibilityResult: number = checkVisibility(CurrentCamera, BasePart, AssetCorners, t1)
								
								if CheckVisibilityResult < 0.3 then
									config.checkedAds += 1
								elseif os.clock() - ClockTime > 0.2 then
									config.duration = os.clock() - ClockTime
									
									return t, config
								else
									t[Count] = {
										distance = Distance,
										boundingBox = { min = ViewportCorners, max = ViewportCorners2 },
										hitRate = CheckVisibilityResult,
										visibleRegions = {
											createSingleVisibleRegionFromWorldSpaceCorners(AssetCorners, CurrentCamera, ViewportInfo)
										},
										adUnitName = AdUnitName,
										assetId = AssetId,
										encryptedAdTrackingData = EncryptedAdTrackingData,
										encryptionMetadata = EncryptionMetadata
									}
									Default:logRobloxTelemetryEvent({
										eventName = "AdIdentifiedInAbuseReport",
										description = "Ad Identified in Report Anything Screenshot",
										backends = { LoggingProtocolModule.TelemetryBackends.Points },
										throttlingPercentage = GetFIntAdIdentifiedTelemetryThrottleHundredthsPercentModule(),
										lastUpdated = { 24, 6, 25 }
									}, nil, {
										assetId = AssetId,
										encryptedAdTrackingData = EncryptedAdTrackingData,
										encryptionMetadata = EncryptionMetadata
									})
									config.checkedAds += 1
									Count += 1
								end
							end
						end
					end
				else
					config.checkedAds += 1
				end
			end
		end
		config.duration = os.clock() - ClockTime
		
		return t, config
	end
}