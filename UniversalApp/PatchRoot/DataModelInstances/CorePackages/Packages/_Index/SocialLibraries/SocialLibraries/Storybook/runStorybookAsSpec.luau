return function(p1, p2, p3)
	local storyRoots = p1.storyRoots
	local mapStory = p1.mapStory
	p2("SHOULD run all stories with no issue", function()
		-- upvalues: storyRoots (ref), p3 (ref), mapStory (ref)
		for i, v in ipairs(storyRoots) do
			for i_1, v_1 in ipairs(v:GetDescendants()) do
				if v_1:IsA("ModuleScript") and v_1.Name:find(".story$") then
					p3("SHOULD mount: " .. v_1:GetFullName(), function(p4)
						-- upvalues: v_1 (ref), mapStory (copy)
						local unknownModule = require(v_1)
						local _, var1 = p4.UnitTestHelpers.mountFrame(mapStory(function()
							-- upvalues: unknownModule (ref)
							return unknownModule
						end)())
						var1()
					end)
				end
			end
		end
	end)
end