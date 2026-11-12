local Parent = script:FindFirstAncestor("AvatarExperienceModel").Parent
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)

local function createDefaultScalesRules()
	return {
		height = { min = 0.9, max = 1.05, increment = 0.01 },
		width = { min = 0.7, max = 1, increment = 0.01 },
		head = { min = 0.95, max = 1, increment = 0.01 },
		proportion = { min = 0, max = 1, increment = 0.01 },
		bodyType = { min = 0, max = 1, increment = 0.01 }
	}
end

local function _()
	return {
		[1] = Enum.AssetType.Hat.Value,
		[2] = Enum.AssetType.FaceAccessory.Value
	}
end

local function createDefaultAdjustmentLimitRule(XPosition, XRotation, XScale)
	return {
		position = {
			xPosition = XPosition,
			yPosition = XPosition,
			zPosition = XPosition
		},
		rotation = {
			xRotation = XRotation,
			yRotation = XRotation,
			zRotation = XRotation
		},
		scale = { xScale = XScale, yScale = XScale, zScale = XScale }
	}
end

local _ = function()
	-- upvalues: createDefaultAdjustmentLimitRule (copy)
	return {
		hat = createDefaultAdjustmentLimitRule(-0.25, -30, 0.8),
		faceAccessory = createDefaultAdjustmentLimitRule(-0.25, -30, 0.8)
	}
end

local _ = function()
	-- upvalues: createDefaultAdjustmentLimitRule (copy)
	return {
		hat = createDefaultAdjustmentLimitRule(0.25, 30, 1.2),
		faceAccessory = createDefaultAdjustmentLimitRule(0.25, 30, 1.2)
	}
end

return function()
	-- upvalues: SignalsModule (copy), createDefaultScalesRules (copy), createDefaultAdjustmentLimitRule (copy), SignalsExperimentalModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Signal3, Signal2_2 = SignalsModule.createSignal((createDefaultScalesRules()))
	local Signal4, Signal2_3 = SignalsModule.createSignal({
		[1] = Enum.AssetType.Hat.Value,
		[2] = Enum.AssetType.FaceAccessory.Value
	})
	local Signal5, Signal2_4 = SignalsModule.createSignal({
		hat = createDefaultAdjustmentLimitRule(-0.25, -30, 0.8),
		faceAccessory = createDefaultAdjustmentLimitRule(-0.25, -30, 0.8)
	})
	local Signal6, Signal2_5 = SignalsModule.createSignal({
		hat = createDefaultAdjustmentLimitRule(0.25, 30, 1.2),
		faceAccessory = createDefaultAdjustmentLimitRule(0.25, 30, 1.2)
	})
	
	return {
		getObtainedAvatarRules = Signal,
		getMinDeltaBodyColorDifference = Signal1,
		getScalesRules = Signal3,
		getAccessoryRefinementTypes = Signal4,
		getAccessoryRefinementLowerBounds = Signal5,
		getAccessoryRefinementUpperBounds = Signal6,
		setAvatarSettings = function(p1, p2, p3, p4, p5)
			-- upvalues: SignalsExperimentalModule (upval), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), Signal2_3 (copy), Signal2_4 (copy), Signal2_5 (copy)
			SignalsExperimentalModule.batch(function()
				-- upvalues: Signal2 (upval), Signal2_1 (upval), p1 (copy), Signal2_2 (upval), p2 (copy), Signal2_3 (upval), p3 (copy), Signal2_4 (upval), p4 (copy), Signal2_5 (upval), p5 (copy)
				Signal2(true)
				Signal2_1(p1)
				Signal2_2(p2)
				Signal2_3(p3)
				Signal2_4(p4)
				Signal2_5(p5)
			end)
		end,
		reset = function()
			-- upvalues: SignalsExperimentalModule (upval), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), createDefaultScalesRules (upval), Signal2_3 (copy), Signal2_4 (copy), createDefaultAdjustmentLimitRule (upval), Signal2_5 (copy)
			SignalsExperimentalModule.batch(function()
				-- upvalues: Signal2 (upval), Signal2_1 (upval), Signal2_2 (upval), createDefaultScalesRules (upval), Signal2_3 (upval), Signal2_4 (upval), createDefaultAdjustmentLimitRule (upval), Signal2_5 (upval)
				Signal2(false)
				Signal2_1(0)
				Signal2_2((createDefaultScalesRules()))
				Signal2_3({
					[1] = Enum.AssetType.Hat.Value,
					[2] = Enum.AssetType.FaceAccessory.Value
				})
				Signal2_4({
					hat = createDefaultAdjustmentLimitRule(-0.25, -30, 0.8),
					faceAccessory = createDefaultAdjustmentLimitRule(-0.25, -30, 0.8)
				})
				Signal2_5({
					hat = createDefaultAdjustmentLimitRule(0.25, 30, 1.2),
					faceAccessory = createDefaultAdjustmentLimitRule(0.25, 30, 1.2)
				})
			end)
		end
	}
end