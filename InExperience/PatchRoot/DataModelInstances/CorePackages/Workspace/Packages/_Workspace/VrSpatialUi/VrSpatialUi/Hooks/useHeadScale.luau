local vrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local parent = vrSpatialUi.Parent
local reactModule = require(parent.React)
local UIManagerModule = require(vrSpatialUi.UIManager)
local inExperienceUIVRIXP = require(parent.SharedExperimentDefinition).InExperienceUIVRIXP

local function _(p0, p1)
	-- upvalues: UIManagerModule (ref)
	local additionalCameraScaleIfNeeded = UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
	
	if p0 and p0.current then
		p0.current.Size = Vector3.new(p1.X * additionalCameraScaleIfNeeded, p1.Y * additionalCameraScaleIfNeeded, p0.current.Size.Z)
	end
end

return function(p2, p3)
	-- upvalues: reactModule (ref), UIManagerModule (ref), inExperienceUIVRIXP (ref)
	local var4, var5 = reactModule.useState(function()
		-- upvalues: UIManagerModule (copy)
		return UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
	end)
	reactModule.useEffect(function()
		-- upvalues: inExperienceUIVRIXP (copy), p2 (ref), p3 (ref), UIManagerModule (copy), var5 (ref)
		if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then
			local var6 = p2
			local var7 = p3
			local additionalCameraScaleIfNeeded = UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
			
			if var6 and var6.current then
				var6.current.Size = Vector3.new(var7.X * additionalCameraScaleIfNeeded, var7.Y * additionalCameraScaleIfNeeded, var6.current.Size.Z)
			end
		else
			var5(UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded())
		end
		local var9 = workspace.CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function()
			-- upvalues: inExperienceUIVRIXP (copy), p2 (copy), p3 (copy), UIManagerModule (copy), var5 (copy)
			if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then
				local var10 = p2
				local var11 = p3
				local additionalCameraScaleIfNeeded = UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
				
				if var10 and var10.current then
					var10.current.Size = Vector3.new(var11.X * additionalCameraScaleIfNeeded, var11.Y * additionalCameraScaleIfNeeded, var10.current.Size.Z)
					
					return
				end
			else
				var5(UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded())
			end
		end)
		
		return function()
			-- upvalues: var9 (ref)
			var9:Disconnect()
		end
	end, if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then { p2, p3 } else {})
	
	return var4, var5
end