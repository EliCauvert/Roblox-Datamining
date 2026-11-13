local _ = require("../core")
local _ = require("./devices")
local _ = require("./ui")

return function(p1, p2, p3, p4, Callback1, Callback)
	assert(#p4.variants == 2 or #p4.variants == 3, "Compare two or three Design drafts")
	local v1 = require("./theme")(p1)
	local DesignDrafts = v1.frame("DesignDrafts", v1.color.canvas)
	v1.place(DesignDrafts, p2, p1.values.udim2(1, 0, 1, -140))
	local DraftsChooseOneToSave = v1.label("Drafts · Choose one to save", v1.color.secondary, v1.size.small)
	p1.set(DraftsChooseOneToSave, "Name", "DraftStatus")
	v1.place(DraftsChooseOneToSave, DesignDrafts, p1.values.udim2(1, -152, 0, 32))
	local DiscardDrafts = v1.button("DiscardDrafts", "Discard drafts")
	v1.place(DiscardDrafts, DesignDrafts, p1.values.udim2(0, 140, 0, 32), p1.values.udim2(1, -140, 0, 0))
	local DraftComparison = v1.frame("DraftComparison")
	v1.place(DraftComparison, DesignDrafts, p1.values.udim2(1, 0, 1, -40), p1.values.udim2(0, 0, 0, 40))
	v1.list(DraftComparison, p1.values.enum("FillDirection", "Horizontal"), 12)
	local List = {}
	local List1 = {}
	local Flag = false
	local Flag1 = false
	
	local function choose(p5)
		-- upvalues: Flag (ref), Flag1 (ref), p4 (copy), p1 (copy), DraftsChooseOneToSave (copy), Callback (copy)
		assert(not Flag and not Flag1, "Drafts are unavailable")
		assert(p4.variants[p5], "Unknown draft index")
		Flag1 = true
		p1.set(DraftsChooseOneToSave, "Text", "Saving selected variant...")
		p1.runtime.scheduler(p1.owner).after(0, function()
			-- upvalues: Flag (upval), p4 (upval), p5 (copy), Flag1 (upval), Callback (upval), p1 (upval), DraftsChooseOneToSave (upval)
			if Flag then return end
			local Success = pcall(p4.pick, p5)
			
			if Flag then return end
			Flag1 = false
			
			if Success then
				Callback()
				
				return
			else
				p1.set(DraftsChooseOneToSave, "Text", "Variant request failed; check source sync")
			end
		end)
	end
	
	table.insert(List1, p1.connect(DiscardDrafts, "Activated", function()
		-- upvalues: Flag1 (ref), Callback (copy)
		if not Flag1 then
			Callback()
		end
	end))
	
	local function dispose()
		-- upvalues: Flag (ref), p4 (copy), p1 (copy), List1 (copy), List (copy), DesignDrafts (copy)
		if Flag then return end
		Flag = true
		local Discard = p4.discard
		
		if Discard then
			p1.runtime.scheduler(p1.owner).after(0, function()
				-- upvalues: Discard (copy)
				pcall(Discard)
			end)
		end
		for _, Connection in List1 do
			Connection:Disconnect()
		end
		for _, value in List do
			value()
		end
		p1.destroy(DesignDrafts)
	end
	
	local Success, Result = pcall(function()
		-- upvalues: p4 (copy), v1 (copy), p1 (copy), DraftComparison (copy), List (copy), Callback1 (copy), p3 (copy), List1 (copy), Flag1 (ref), choose (copy)
		for i, variant in p4.variants do
			local FrameResult = v1.frame("Draft" .. i, v1.color.panel)
			p1.set(FrameResult, "LayoutOrder", i)
			p1.set(FrameResult, "Size", p1.values.udim2(1 / #p4.variants, (#p4.variants - 1) * -12 / #p4.variants, 1, 0))
			p1.set(FrameResult, "Parent", DraftComparison)
			v1.place(v1.label(variant.title, v1.color.text, v1.size.text, v1.font.bold), FrameResult, p1.values.udim2(1, 0, 0, 28))
			local DraftPreview = v1.frame("DraftPreview")
			v1.place(DraftPreview, FrameResult, p1.values.udim2(1, 0, 1, -76), p1.values.udim2(0, 0, 0, 32))
			table.insert(List, Callback1(variant.source, p3, DraftPreview))
			local ChooseVariant = v1.button("ChooseVariant", "Choose this variant", v1.color.white)
			p1.set(ChooseVariant, "BackgroundTransparency", 0)
			p1.set(ChooseVariant, "BackgroundColor3", v1.color.accent)
			v1.place(ChooseVariant, FrameResult, p1.values.udim2(1, -16, 0, 32), p1.values.udim2(0, 8, 1, -36))
			table.insert(List1, p1.connect(ChooseVariant, "Activated", function()
				-- upvalues: Flag1 (upval), choose (upval), i (copy)
				if not Flag1 then
					choose(i)
					
					return
				end
			end))
		end
	end)
	
	if not Success then
		dispose()
		error(Result, 0)
	end
	return { dispose = dispose, choose = choose }
end