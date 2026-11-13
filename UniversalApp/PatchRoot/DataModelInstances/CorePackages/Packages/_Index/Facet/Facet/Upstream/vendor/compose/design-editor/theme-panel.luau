local CoreModule = require("../core")
local _ = require("./ui")

return {
	create = function(p1, p2, p3)
		-- upvalues: CoreModule (copy)
		local v1 = require("./theme")(p1)
		local DesignTheme = v1.scroller("DesignTheme")
		p1.set(DesignTheme, "Size", p1.values.udim2(1, 0, 1, 0))
		p1.set(DesignTheme, "Visible", false)
		p1.set(DesignTheme, "Parent", p2)
		v1.pad(DesignTheme, 12, 12, 4, 12)
		v1.list(DesignTheme, p1.values.enum("FillDirection", "Vertical"), 8)
		local SharedTokens = v1.label("Shared tokens", v1.color.secondary, v1.size.small)
		p1.set(SharedTokens, "Name", "ThemeStatus")
		p1.set(SharedTokens, "Size", p1.values.udim2(1, 0, 0, 24))
		p1.set(SharedTokens, "LayoutOrder", 0)
		p1.set(SharedTokens, "Parent", DesignTheme)
		local FocusLosts = {}
		local Flag = false
		
		local function write(Id, Text: string)
			-- upvalues: Flag (ref), p3 (copy), p1 (copy), SharedTokens (copy)
			assert(not Flag, "Theme is closed")
			local v2 = nil
			
			for _, field in p3.fields do
				if field.id == Id then
					v2 = field
					break
				end
			end
			local v3 = assert(v2, "Unknown theme token: " .. Id)
			assert(if v3.kind == "color" then type(Text) == "string" and string.match(Text, "^#%x%x%x%x%x%x$") ~= nil else type(Text) == "number" and (Text == Text and (v3.minimum or 0) <= Text) and Text <= (v3.maximum or 512), "Enter #RRGGBB or a value within the token's range")
			assert(p3.write(Id, Text), "Token change failed; source preserved")
			p1.set(SharedTokens, "Text", "Shared tokens saved")
		end
		
		local OwnResult = CoreModule.owner.own(p1.owner, CoreModule.createRootOwner(function()
			-- upvalues: p3 (copy), v1 (copy), p1 (copy), DesignTheme (copy), CoreModule (upval), FocusLosts (copy), SharedTokens (copy), Flag (ref), write (copy)
			for i, field in p3.fields do
				local FrameResult = v1.frame(field.id)
				p1.set(FrameResult, "Size", p1.values.udim2(1, 0, 0, 60))
				p1.set(FrameResult, "LayoutOrder", i)
				p1.set(FrameResult, "Parent", DesignTheme)
				v1.place(v1.label(field.label, v1.color.secondary, v1.size.small), FrameResult, p1.values.udim2(1, 0, 0, 24))
				local FieldResult = v1.field("")
				p1.set(FieldResult, "Name", "TokenValue")
				v1.place(FieldResult, FrameResult, p1.values.udim2(1, 0, 0, 32), p1.values.udim2(0, 0, 0, 26))
				CoreModule.watch(function(p4)
					-- upvalues: p1 (upval), FieldResult (copy), field (copy)
					p1.set(FieldResult, "Text", (tostring(field.read(p4))))
				end)
				table.insert(FocusLosts, p1.connect(FieldResult, "FocusLost", function()
					-- upvalues: p1 (upval), FieldResult (copy), field (copy), SharedTokens (upval), Flag (upval), write (upval)
					local Text: string = p1.text(FieldResult, "Text")
					local Uppered = if field.kind == "color" then string.upper(Text) else tonumber(Text)
					
					if (if field.kind == "color" then type(Uppered) == "string" and string.match(Uppered, "^#%x%x%x%x%x%x$") ~= nil else type(Uppered) == "number" and (Uppered == Uppered and ((field.minimum or 0) <= Uppered and Uppered <= (field.maximum or 512)))) and Uppered ~= nil then
						p1.runtime.scheduler(p1.owner).after(0, function()
							-- upvalues: Flag (upval), write (upval), field (upval), Uppered (copy), p1 (upval), SharedTokens (upval)
							if Flag then return end
							local Success, Result = pcall(write, field.id, Uppered)
							
							if not Flag then
								p1.set(SharedTokens, "Text", if Success then "Shared tokens saved" else tostring(Result))
							end
						end)
						
						return
					else
						p1.set(SharedTokens, "Text", "Enter #RRGGBB or a value within the token's range")
					end
				end))
			end
		end, p1.runtime.reactor).dispose)
		
		return {
			root = DesignTheme,
			write = write,
			dispose = function()
				-- upvalues: Flag (ref), OwnResult (copy), FocusLosts (copy), p1 (copy), DesignTheme (copy)
				Flag = true
				OwnResult()
				
				for _, focusLost in FocusLosts do
					focusLost:Disconnect()
				end
				p1.destroy(DesignTheme)
			end
		}
	end
}