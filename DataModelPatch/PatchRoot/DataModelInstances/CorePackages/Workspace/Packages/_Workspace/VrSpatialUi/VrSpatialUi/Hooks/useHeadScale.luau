local VrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local Parent = VrSpatialUi.Parent
local ReactModule = require(Parent.React)
local UIManagerModule = require(VrSpatialUi.UIManager)
local InExperienceUIVRIXP = require(Parent.SharedExperimentDefinition).InExperienceUIVRIXP

local function _(p1, Vector)
	-- upvalues: UIManagerModule (copy)
	local AdditionalCameraScaleIfNeeded = UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
	
	if p1 and p1.current then
		p1.current.Size = Vector3.new(Vector.X * AdditionalCameraScaleIfNeeded, Vector.Y * AdditionalCameraScaleIfNeeded, p1.current.Size.Z)
	end
end

return function(p1, Vector)
	-- upvalues: ReactModule (copy), UIManagerModule (copy), InExperienceUIVRIXP (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: UIManagerModule (upval)
		return UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
	end)
	ReactModule.useEffect(function()
		-- upvalues: InExperienceUIVRIXP (upval), p1 (copy), Vector (copy), UIManagerModule (upval), UseStateResult2 (copy)
		if InExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then
			local AdditionalCameraScaleIfNeeded = UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
			
			if p1 and p1.current then
				p1.current.Size = Vector3.new(Vector.X * AdditionalCameraScaleIfNeeded, Vector.Y * AdditionalCameraScaleIfNeeded, p1.current.Size.Z)
			end
		else
			UseStateResult2(UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded())
		end
		local Connection = workspace.CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function()
			-- upvalues: InExperienceUIVRIXP (upval), p1 (upval), Vector (upval), UIManagerModule (upval), UseStateResult2 (upval)
			if InExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then
				local AdditionalCameraScaleIfNeeded = UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
				
				if p1 and p1.current then
					p1.current.Size = Vector3.new(Vector.X * AdditionalCameraScaleIfNeeded, Vector.Y * AdditionalCameraScaleIfNeeded, p1.current.Size.Z)
					
					return
				end
			else
				UseStateResult2(UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded())
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, if InExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then { p1, Vector } else {})
	
	return UseStateResult, UseStateResult2
end