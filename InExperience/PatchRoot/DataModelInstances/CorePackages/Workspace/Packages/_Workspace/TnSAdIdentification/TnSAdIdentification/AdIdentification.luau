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
	getAdsForPoint = function(p1, p2)
		local t = {}
		
		for i, v in pairs(p1) do
			local boundingBox = v.boundingBox
			
			if p2.X >= boundingBox.min.X and p2.Y >= boundingBox.min.Y and (boundingBox.max.X >= p2.X and boundingBox.max.Y >= p2.Y) then
				for i_1, v_1 in ipairs(v.visibleRegions) do
					local convexHull = v_1.convexHull
					
					if #convexHull >= 3 then
						local var1 = convexHull[#convexHull]
						local var2 = true
						local var3 = true
						
						for i_2, v_2 in ipairs(convexHull) do
							local var4 = (v_2 - var1):Cross(p2 - var1)
							var3 = var3 and var4 <= 0
							var2 = var2 and var4 >= 0
							var1 = v_2
						end
						if var2 or var3 then
							t[i] = v
							continue
						end
					end
				end
			end
		end
		return t
	end,
	getVisibleAds = function()
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
		local adUnitName, assetId, encryptedAdTrackingData, encryptionMetadata, assetCorners, magnitude, viewportCorners, viewportCorners_1, var5
		local character = localPlayer.Character
		local _ = nil
		local t_2 = {}
		local var6 = if character then getLocalCharacterPosition(character) or currentCamera.CFrame.Position else currentCamera.CFrame.Position
		local viewportInfo = identificationUtils.getViewportInfo()
		t_1.viewportInfo = viewportInfo
		local processTime = os.clock()
		t_1.totalAds = #reportAdInfo
		
		local _ = function()
			-- upvalues: t_1 (ref), processTime (ref)
			t_1.duration = os.clock() - processTime
			
			return t_1
		end
		
		local _ = function()
			-- upvalues: processTime (ref)
			return os.clock() - processTime > 0.2
		end
		
		local var7 = 1
		
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
						local var8, var9 = getAdCenterAndScreenArea(assetCorners, currentCamera)
						magnitude = (var8 - var6).Magnitude
						
						if (var8 - currentCamera.CFrame.Position):Dot(currentCamera.CFrame.LookVector) < 0 then
							t_1.checkedAds += 1
						else
							local unit = (assetCorners[1] - assetCorners[2]):Cross(assetCorners[1] - assetCorners[3]).Unit
							
							if unit:Dot(var8 - basePart.Position) < 0 then
								unit = -unit
							end
							if (currentCamera.CFrame.Position - var8):Dot(unit) < 0 then
								t_1.checkedAds += 1
							else
								viewportCorners, viewportCorners_1 = identificationUtils.getViewportCorners(assetCorners, currentCamera, viewportInfo)
								
								if viewportCorners == identificationUtils.defaultMin then
									t_1.checkedAds += 1
								elseif var9 < maxValue then
									t_1.checkedAds += 1
								else
									var5 = checkVisibility(currentCamera, basePart, assetCorners, t_2)
									
									if var5 < 0.3 then
										t_1.checkedAds += 1
									elseif os.clock() - processTime <= 0.2 then
										t[var7] = {
											distance = magnitude,
											boundingBox = { min = viewportCorners, max = viewportCorners_1 },
											hitRate = var5,
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
										var7 += 1
										continue
									end
									local var10 = t
									t_1.duration = os.clock() - processTime
									
									return var10, t_1
								end
							end
						end
					else
						t_1.checkedAds += 1
					end
				end
			end
			local var11 = t
			t_1.duration = os.clock() - processTime
			
			return var11, t_1
		end
		t_1.duration = os.clock() - processTime
		
		return t, t_1
	end
}

function getLocalCharacterPosition(p3)
	local humanoidRootPart = p3:FindFirstChild("HumanoidRootPart")
	
	return if humanoidRootPart then humanoidRootPart.Position else nil
end

function checkVisibility(p3, p4, p5, p6)
	local position = p3.CFrame.Position
	local viewportSize = p3.ViewportSize
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.FilterDescendantsInstances = p6
	raycastParams.IgnoreWater = true
	local var12 = 0
	local var13 = 0
	local var14 = p5[2] - p5[1]
	local var15 = p5[3] - p5[1]
	
	for i_1 = 1, 4 do
		local var16 = var14 * (i_1 - 0.5) / 4
		
		for i = 1, 4 do
			local var17 = p5[1] + var16 + var15 * (i - 0.5) / 4
			local var18 = var17 - position
			var12 += 1
			local var19, _ = p3:WorldToViewportPoint(var17)
			
			if var19.Z >= 0 and var19.X >= 0 and (var19.Y >= 0 and viewportSize.X >= var19.X) and viewportSize.Y >= var19.Y then
				local var20 = workspace:Raycast(position, var18 * 1.1, raycastParams)
				
				if var20 and var20.Instance == p4 then
					var13 += 1
				end
			end
		end
	end
	return var13 / var12
end

function createSingleVisibleRegionFromWorldSpaceCorners(p7, p8, p9)
	-- upvalues: identificationUtils (ref)
	local list = table.create(#p7)
	
	for i, v in ipairs(p7) do
		local var21, _, _ = identificationUtils.worldToFullViewportPointNormalized(v, p8, p9)
		list[i] = Vector2.new(var21.X, var21.Y)
	end
	return {
		id = 1,
		convexHull = { list[1], list[2], list[4], list[3] }
	}
end

function getAdCenterAndScreenArea(p10, p11)
	local viewportSize = p11.ViewportSize
	local var22 = Vector3.new(0, 0, 0)
	local var23 = 0
	local t = {}
	
	for i, v in ipairs(p10) do
		var22 += v
		local var24, _ = p11:WorldToViewportPoint(v)
		table.insert(t, Vector2.new(var24.X, var24.Y) / viewportSize)
	end
	return var22 / 4, (var23 + math.abs((t[2] - t[1]):Cross(t[3] - t[1])) + math.abs((t[2] - t[4]):Cross(t[3] - t[4]))) / 2
end

return t