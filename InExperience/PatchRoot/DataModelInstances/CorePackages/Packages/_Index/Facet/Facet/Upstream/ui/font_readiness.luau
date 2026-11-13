local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local self = setmetatable({}, { __mode = "k" })

local function _(p1)
	local FontFaceStyled = p1:GetStyled("FontFace")
	assert(typeof(FontFaceStyled) == "Font", "text font must be a Font")
	
	return FontFaceStyled
end

local _ = function(p1)
	local TextSizeStyled = p1:GetStyled("TextSize")
	assert(type(TextSizeStyled) == "number", "text size must be a number")
	
	return TextSizeStyled
end

return function(p1, p2)
	-- upvalues: self (copy), CoreModule (copy)
	local ContentProvider = p1.config.services.ContentProvider
	local TextService = p1.config.services.TextService
	local SelfEntry = if TextService then self[TextService] or {} else {}
	
	if TextService then
		self[TextService] = SelfEntry
	end
	if ContentProvider == nil and TextService == nil or task == nil then
		return function(_): boolean
			return true
		end
	else
		local TextBoundsParams = if TextService then p1.Host.GetTextBoundsParams({ Width = 0 }) else nil
		local v1 = assert(p1.Compose.currentOwner())
		local Joined = nil
		local Joined1 = nil
		local DeferredThread = nil
		p1.Compose.cleanup(function()
			-- upvalues: DeferredThread (ref)
			if DeferredThread and coroutine.status(DeferredThread) == "suspended" then
				pcall(task.cancel, DeferredThread)
			end
			DeferredThread = nil
		end)
		
		local function collect()
			-- upvalues: p2 (copy)
			local List = {}
			
			for _, value in p2 do
				local Descendants = value:GetDescendants()
				table.insert(Descendants, value)
				
				for _, descendant in Descendants do
					if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
						table.insert(List, descendant)
					end
				end
			end
			return List
		end
		
		return function(p3): boolean
			-- upvalues: collect (copy), TextService (copy), SelfEntry (copy), Joined (ref), DeferredThread (ref), TextBoundsParams (copy), ContentProvider (copy), CoreModule (upval), v1 (copy), Joined1 (ref)
			local t = {}
			local P5 = p3 or collect()
			for _, value in P5 do
				local FontFaceStyled = value:GetStyled("FontFace")
				assert(typeof(FontFaceStyled) == "Font", "text font must be a Font")
				local v2 = "%*:%*:%*:%*"
				local Family = FontFaceStyled.Family
				local Name = FontFaceStyled.Weight.Name
				local Name1 = FontFaceStyled.Style.Name
				local TextSizeStyled = value:GetStyled("TextSize")
				assert(type(TextSizeStyled) == "number", "text size must be a number")
				t[v2:format(Family, Name, Name1, TextSizeStyled)] = value
			end
			local List = {}
			
			for i in t do
				table.insert(List, i)
			end
			table.sort(List)
			local List1 = {}
			
			for _, value1 in List do
				table.insert(List1, t[value1])
			end
			local Joined2 = table.concat(List, ";")
			local HasTextService = TextService ~= nil
			for _, value2 in List do
				HasTextService = HasTextService and SelfEntry[value2] == true
			end
			if HasTextService then
				return true
			end
			if Joined2 ~= Joined then
				if DeferredThread and coroutine.status(DeferredThread) == "suspended" then
					pcall(task.cancel, DeferredThread)
				end
				DeferredThread = nil
				Joined = Joined2
				DeferredThread = task.defer(function()
					-- upvalues: TextService (upval), TextBoundsParams (upval), List1 (copy), SelfEntry (upval), List (copy), ContentProvider (upval), CoreModule (upval), v1 (upval), Joined (upval), Joined2 (copy), Joined1 (upval)
					if TextService and TextBoundsParams then
						for i, Label in List1 do
							if not SelfEntry[List[i]] then
								local FontFaceStyled = Label:GetStyled("FontFace")
								assert(typeof(FontFaceStyled) == "Font", "text font must be a Font")
								TextBoundsParams.Font = FontFaceStyled
								local TextSizeStyled = Label:GetStyled("TextSize")
								assert(type(TextSizeStyled) == "number", "text size must be a number")
								TextBoundsParams.Size = TextSizeStyled
								TextBoundsParams.Text = Label.Text
								TextBoundsParams.RichText = Label.RichText
								local TextBoundsParamsFont = TextBoundsParams.Font
								local Text: string = `{TextBoundsParamsFont.Family}:{TextBoundsParamsFont.Weight.Name}:{TextBoundsParamsFont.Style.Name}:{TextBoundsParams.Size}`
								
								if pcall(function()
									-- upvalues: TextService (copy), TextBoundsParams (copy)
									TextService:GetTextBoundsAsync(TextBoundsParams)
								end) then
									SelfEntry[Text] = true
								end
							end
						end
					elseif ContentProvider then
						pcall(function()
							-- upvalues: ContentProvider (copy), List1 (upval)
							ContentProvider:PreloadAsync(List1)
						end)
					end
					if not CoreModule.owner.isDisposed(v1) and Joined == Joined2 then
						Joined1 = Joined2
					end
				end)
			end
			return Joined1 == Joined2
		end
	end
end