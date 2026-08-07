-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:25 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 1 ]]
	local storyRoots = p0.storyRoots
	local mapStory = p0.mapStory
	p1("SHOULD run all stories with no issue", function() --[[ line: 5 ]]
		-- upvalues: storyRoots (ref), p2 (ref), mapStory (ref)
		for i, v in ipairs(storyRoots) do
			for i_1, v_1 in ipairs(v:GetDescendants()) do
				if v_1:IsA("ModuleScript") and v_1.Name:find(".story$") then
					p2("SHOULD mount: " .. v_1:GetFullName(), function(p3) --[[ line: 10 ]]
						-- upvalues: v_1 (ref), mapStory (copy)
						local unknownModule = require(v_1)
						local _, var1 = p3.UnitTestHelpers.mountFrame(mapStory(function() --[[ line: 12 ]]
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