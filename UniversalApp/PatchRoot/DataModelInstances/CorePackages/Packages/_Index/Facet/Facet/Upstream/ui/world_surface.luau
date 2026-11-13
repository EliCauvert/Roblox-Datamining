local _ = require("./types")
local _ = require("./control_types")

return function(p1, p2)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local Host = p1.Host
	
	function p2.worldSurface(Object, Callback)
		-- upvalues: Host (copy), Compose (copy), Runtime (copy)
		assert(Object:IsA("BillboardGui") or Object:IsA("SurfaceGui"), "Facet worldSurface requires BillboardGui or SurfaceGui")
		local v1 = Host.Folder("WorldSurface")({})
		local CellResult = Compose.cell(nil)
		
		local function locate()
			-- upvalues: v1 (copy), CellResult (copy)
			local Parent = v1.Parent
			local StyleLink = nil
			local StyleLink1 = nil
			while Parent do
				StyleLink1 = Parent:FindFirstChildWhichIsA("StyleLink")
				
				if not StyleLink1 or not StyleLink1:IsA("StyleLink") then
					Parent = Parent.Parent
					continue
				end
				StyleLink = StyleLink1
				break
			end
			CellResult:set(StyleLink)
		end
		
		Runtime.connect(v1, "AncestryChanged", locate)
		Runtime.mountFragment(function()
			-- upvalues: Compose (upval), Object (copy), CellResult (copy), Runtime (upval), Host (upval), Callback (copy)
			return {
				Compose.portal(Object, function()
					-- upvalues: Compose (upval), CellResult (upval), Runtime (upval), Host (upval), Callback (upval)
					local CellResult1 = Compose.cell(nil)
					Compose.watch(function(Callback)
						-- upvalues: CellResult (upval), Runtime (upval), Compose (upval), CellResult1 (copy)
						local CallbackResult = Callback(CellResult)
						
						if CallbackResult then
							local StyleSheet = Runtime.observe(CallbackResult, "StyleSheet")
							Compose.watch(function(Callback)
								-- upvalues: StyleSheet (copy), CellResult1 (upval)
								local CallbackResult = Callback(StyleSheet)
								CellResult1:set(if typeof(CallbackResult) == "Instance" and CallbackResult:IsA("StyleSheet") then CallbackResult else nil)
							end)
							
							return
						else
							CellResult1:set(nil)
						end
					end)
					
					return { Host.StyleLink({ StyleSheet = CellResult1 }), Callback() }
				end)
			}
		end, v1)
		locate()
		
		return v1
	end
end