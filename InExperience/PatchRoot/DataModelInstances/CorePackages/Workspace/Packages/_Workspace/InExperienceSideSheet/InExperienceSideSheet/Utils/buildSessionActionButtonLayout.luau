local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local enumsModule = require(inExperienceSideSheet.Common.Enums)
local _ = require(inExperienceSideSheet.Common.Types)
local shortcutButtonModule = require(inExperienceSideSheet.Components.ShortcutButton)
local buttonWidth = enumsModule.ButtonWidth

local function _(p1, p2, p3)
	-- upvalues: reactModule (ref), shortcutButtonModule (ref)
	return reactModule.createElement(shortcutButtonModule, {
		label = p1.label,
		getShortcutIcon = p1.getShortcutIcon,
		getOnActivated = p1.getOnActivated,
		getIsEnabled = p1.getIsEnabled,
		width = p3,
		layoutOrder = p2
	})
end

local function buildHalfWidthRowLayoutItem(p1, p2)
	-- upvalues: buttonWidth (ref), reactModule (ref), shortcutButtonModule (ref), view (ref)
	if #p1 == 1 then
		local var1 = p1[1]
		
		return {
			key = var1.name,
			node = reactModule.createElement(shortcutButtonModule, {
				label = var1.label,
				getShortcutIcon = var1.getShortcutIcon,
				getOnActivated = var1.getOnActivated,
				getIsEnabled = var1.getIsEnabled,
				width = buttonWidth.Full,
				layoutOrder = p2
			})
		}
	end
	local t = {}
	
	for i, v in p1 do
		t[v.name] = reactModule.createElement(shortcutButtonModule, {
			label = v.label,
			getShortcutIcon = v.getShortcutIcon,
			getOnActivated = v.getOnActivated,
			getIsEnabled = v.getIsEnabled,
			width = buttonWidth.Half,
			layoutOrder = i
		})
	end
	return {
		key = "HalfWidthRow_" .. p4,
		node = reactModule.createElement(view, {
			tag = "row gap-small size-full-0 auto-y",
			LayoutOrder = p2
		}, t)
	}
end

return function(p3)
	-- upvalues: buildHalfWidthRowLayoutItem (ref), buttonWidth (ref), reactModule (ref), shortcutButtonModule (ref)
	local t = {}
	local var2 = 0
	local t_1 = {}
	
	local function _()
		-- upvalues: t_1 (ref), var2 (write), buildHalfWidthRowLayoutItem (copy), t (ref)
		if #t_1 == 0 then
			return
		end
		var2 += 1
		local var3 = buildHalfWidthRowLayoutItem(t_1, var2)
		t[var3.key] = var3.node
		table.clear(t_1)
	end
	
	for i, v in p3 do
		if (v.width or buttonWidth.Full) == buttonWidth.Half then
			table.insert(t_1, v)
			
			if #t_1 == 2 and #t_1 ~= 0 then
				var2 += 1
				local var3 = buildHalfWidthRowLayoutItem(t_1, var2)
				t[var3.key] = var3.node
				table.clear(t_1)
			end
		elseif #t_1 ~= 0 then
			var2 += 1
			local var4 = buildHalfWidthRowLayoutItem(t_1, var2)
			t[var4.key] = var4.node
			table.clear(t_1)
		end
		var2 += 1
		t[v.name] = reactModule.createElement(shortcutButtonModule, {
			label = v.label,
			getShortcutIcon = v.getShortcutIcon,
			getOnActivated = v.getOnActivated,
			getIsEnabled = v.getIsEnabled,
			width = buttonWidth.Full,
			layoutOrder = var2
		})
	end
	if #t_1 ~= 0 then
		local var5 = buildHalfWidthRowLayoutItem(t_1, var2 + 1)
		t[var5.key] = var5.node
		table.clear(t_1)
	end
	return t
end