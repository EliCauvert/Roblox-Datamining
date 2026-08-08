local adService = game:GetService("AdService")
local playersService = game:GetService("Players")
local tnSAdIdentification = script:FindFirstAncestor("TnSAdIdentification")
local getFIntAdIdentificationMinimumAreaPerMyriadModule = require(tnSAdIdentification.Flags.GetFIntAdIdentificationMinimumAreaPerMyriad)
local getFIntAdIdentifiedTelemetryThrottleHundredthsPercentModule = require(tnSAdIdentification.Flags.GetFIntAdIdentifiedTelemetryThrottleHundredthsPercent)
local parent = tnSAdIdentification.Parent
local loggingProtocolModule = require(parent.LoggingProtocol)
local default = loggingProtocolModule.default
local identificationUtils = require(parent.AvatarIdentification).IdentificationUtils
local maxValue = math.max(getFIntAdIdentificationMinimumAreaPerMyriadModule() / 10000, 0)
local t = {
	getAdsForPoint = function(p0, p1) --[[ line: 175 ]]
		local t = {}
		
		for i, v in pairs(p0) do
			local boundingBox = v.boundingBox
			
			if p1.X >= boundingBox.min.X and p1.Y >= boundingBox.min.Y and (boundingBox.max.X >= p1.X and boundingBox.max.Y >= p1.Y) then
				for i_1, v_1 in ipairs(v.visibleRegions) do
					local convexHull = v_1.convexHull
					
					if #convexHull >= 3 then
						local var9 = convexHull[#convexHull]
						local var10 = true
						local var11 = true
						
						for i_2, v_2 in ipairs(convexHull) do
							local var12 = (v_2 - var9):Cross(p1 - var9)
							var11 = var11 and var12 <= 0
							var10 = var10 and var12 >= 0
							var9 = v_2
						end
						if var10 or var11 then
							t[i] = v
							continue
						end
					end
				end
			end
		end
		return t
	end,
	getVisibleAds = function() --[[ line: 211 ]]
		-- upvalues: adService (ref), playersService (ref), identificationUtils (ref), maxValue (ref), default (ref), loggingProtocolModule (ref), getFIntAdIdentifiedTelemetryThrottleHundredthsPercentModule (ref)
		local t = {}
		local t_1 = { totalAds = 0, checkedAds = 0, duration = 0 }
		local reportAdInfo = adService:GetReportAdInfo()
		local currentCamera = workspace.CurrentCamera
		
		if not currentCamera then
			return t, t_1
		end
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then
			return t, t_1
		end
		local adUnitName, assetId, encryptedAdTrackingData, encryptionMetadata, assetCorners, magnitude, viewportCorners, viewportCorners_1, var26
		local character = localPlayer.Character
		local _ = nil
		local t_2 = {}
		local var17 = if character then getLocalCharacterPosition(character) or currentCamera.CFrame.Position else currentCamera.CFrame.Position
		local viewportInfo = identificationUtils.getViewportInfo()
		t_1.viewportInfo = viewportInfo
		local processTime = os.clock()
		t_1.totalAds = #reportAdInfo
		
		local _ = function() --[[ line: 247 ]]
			-- upvalues: t_1 (ref), processTime (ref)
			t_1.duration = os.clock() - processTime
			
			return t_1
		end
		
		local _ = function() --[[ line: 252 ]]
			-- upvalues: processTime (ref)
			return os.clock() - processTime > 0.2
		end
		
		local var20 = 1
		
		for i, v in ipairs(reportAdInfo) do
			if os.clock() - processTime <= 0.2 then
				local basePart = v.basePart
				adUnitName = v.adUnitName
				assetId = v.assetId
				encryptedAdTrackingData = v.encryptedAdTrackingData
				encryptionMetadata = v.encryptionMetadata
				
				if encryptedAdTrackingData == "" or encryptionMetadata == "" or assetId == "11307989327" then
					t_1.checkedAds += 1
				else
					assetCorners = v.assetCorners
					
					if assetCorners and #assetCorners >= 4 then
						local var22, var23 = getAdCenterAndScreenArea(assetCorners, currentCamera)
						magnitude = (var22 - var17).Magnitude
						
						if (var22 - currentCamera.CFrame.Position):Dot(currentCamera.CFrame.LookVector) < 0 then
							t_1.checkedAds += 1
						else
							local unit = (assetCorners[1] - assetCorners[2]):Cross(assetCorners[1] - assetCorners[3]).Unit
							
							if unit:Dot(var22 - basePart.Position) < 0 then
								unit = -unit
							end
							if (currentCamera.CFrame.Position - var22):Dot(unit) < 0 then
								t_1.checkedAds += 1
							else
								viewportCorners, viewportCorners_1 = identificationUtils.getViewportCorners(assetCorners, currentCamera, viewportInfo)
								
								if viewportCorners == identificationUtils.defaultMin then
									t_1.checkedAds += 1
								elseif var23 < maxValue then
									t_1.checkedAds += 1
								else
									var26 = checkVisibility(currentCamera, basePart, assetCorners, t_2)
									
									if var26 < 0.3 then
										t_1.checkedAds += 1
									elseif os.clock() - processTime <= 0.2 then
										t[var20] = {
											distance = magnitude,
											boundingBox = { min = viewportCorners, max = viewportCorners_1 },
											hitRate = var26,
											visibleRegions = {
												createSingleVisibleRegionFromWorldSpaceCorners(assetCorners, currentCamera, viewportInfo)
											},
											adUnitName = adUnitName,
											assetId = assetId,
											encryptedAdTrackingData = encryptedAdTrackingData,
											encryptionMetadata = encryptionMetadata
										}
										default:logRobloxTelemetryEvent({
											eventName = "AdIdentifiedInAbuseReport",
											description = "Ad Identified in Report Anything Screenshot",
											backends = { loggingProtocolModule.TelemetryBackends.Points },
											throttlingPercentage = getFIntAdIdentifiedTelemetryThrottleHundredthsPercentModule(),
											lastUpdated = { 24, 6, 25 }
										}, nil, {
											assetId = assetId,
											encryptedAdTrackingData = encryptedAdTrackingData,
											encryptionMetadata = encryptionMetadata
										})
										t_1.checkedAds += 1
										var20 += 1
										continue
									end
									local var27 = t
									t_1.duration = os.clock() - processTime
									
									return var27, t_1
								end
							end
						end
					else
						t_1.checkedAds += 1
					end
				end
			end
			local var21 = t
			t_1.duration = os.clock() - processTime
			
			return var21, t_1
		end
		t_1.duration = os.clock() - processTime
		
		return t, t_1
	end
}

function getLocalCharacterPosition(p2) --[[ line: 30 ]]
	local humanoidRootPart = p2:FindFirstChild("HumanoidRootPart")
	
	return if humanoidRootPart then humanoidRootPart.Position else nil
end

function checkVisibility(p3, p4, p5, p6) --[[ line: 42 ]]
	local position = p3.CFrame.Position
	local viewportSize = p3.ViewportSize
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.FilterDescendantsInstances = p6
	raycastParams.IgnoreWater = true
	local var30 = 0
	local var31 = 0
	local var32 = p5[2] - p5[1]
	local var33 = p5[3] - p5[1]
	
	for i_1 = 1, 4 do
		local var34 = var32 * (i_1 - 0.5) / 4
		
		for i = 1, 4 do
			local var35 = p5[1] + var34 + var33 * (i - 0.5) / 4
			local var36 = var35 - position
			var30 += 1
			local var37, _ = p3:WorldToViewportPoint(var35)
			
			if var37.Z >= 0 and var37.X >= 0 and (var37.Y >= 0 and viewportSize.X >= var37.X) and viewportSize.Y >= var37.Y then
				local var38 = workspace:Raycast(position, var36 * 1.1, raycastParams)
				
				if var38 and var38.Instance == p4 then
					var31 += 1
				end
			end
		end
	end
	return var31 / var30
end

function createSingleVisibleRegionFromWorldSpaceCorners(p7, p8, p9) --[[ line: 90 ]]
	-- upvalues: identificationUtils (ref)
	local list = table.create(#p7)
	
	for i, v in ipairs(p7) do
		local var40, _, _ = identificationUtils.worldToFullViewportPointNormalized(v, p8, p9)
		list[i] = Vector2.new(var40.X, var40.Y)
	end
	return {
		id = 1,
		convexHull = { list[1], list[2], list[4], list[3] }
	}
end

function getAdCenterAndScreenArea(p10, p11) --[[ line: 107 ]]
	local viewportSize = p11.ViewportSize
	local var41 = Vector3.new(0, 0, 0)
	local var42 = 0
	local t = {}
	
	for i, v in ipairs(p10) do
		var41 += v
		local var44, _ = p11:WorldToViewportPoint(v)
		table.insert(t, Vector2.new(var44.X, var44.Y) / viewportSize)
	end
	return var41 / 4, (var42 + math.abs((t[2] - t[1]):Cross(t[3] - t[1])) + math.abs((t[2] - t[4]):Cross(t[3] - t[4]))) / 2
end

return t