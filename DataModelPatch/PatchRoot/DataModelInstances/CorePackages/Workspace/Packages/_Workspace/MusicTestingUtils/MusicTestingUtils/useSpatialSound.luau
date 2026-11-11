local UseEffectFunction = require(script:FindFirstAncestor("MusicTestingUtils").Parent.React).useEffect

return function(p1, p2)
	-- upvalues: UseEffectFunction (copy)
	UseEffectFunction(function()
		-- upvalues: p2 (copy), p1 (copy)
		local List = {}
		
		if p2 then
			local CurrentCamera = workspace.CurrentCamera
			assert(CurrentCamera, "No CurrentCamera")
			local Sound = Instance.new("Sound")
			Sound.Name = `Sound_{p1}`
			Sound.SoundId = `rbxassetid://{p1}`
			Sound.Looped = true
			table.insert(List, Sound)
			local Part = Instance.new("Part")
			Part.Name = `PluginSoundEmitter_{p1}`
			Part.Position = CurrentCamera.CFrame.Position
			Part.Anchored = true
			table.insert(List, Part)
			Sound.Parent = Part
			Part.Parent = p2.current
			Sound:Play()
		end
		return function()
			-- upvalues: List (copy)
			for _, value in List do
				value:Destroy()
			end
		end
	end, { p1, p2 })
end