local v1 = nil

return function()
	-- upvalues: v1 (ref)
	pcall(function()
		-- upvalues: v1 (upval)
		if v1 == nil then
			local HapticEffect = Instance.new("HapticEffect")
			HapticEffect.Type = Enum.HapticEffectType.UIHover
			HapticEffect.Position = vector.create(0, 0, 0)
			HapticEffect.Radius = 100
			HapticEffect.Parent = workspace
			v1 = HapticEffect
		end
		v1:Play()
	end)
end