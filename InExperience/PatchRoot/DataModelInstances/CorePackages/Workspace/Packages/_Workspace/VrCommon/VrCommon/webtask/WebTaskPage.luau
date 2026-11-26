local Parent = script:FindFirstAncestor("VrCommon").Parent
local Url = require(Parent.Http).Url
local config = {
	AccountInfo = require(Parent.UrlBuilder).UrlBuilder.static.settings.account
}

return {
	AccountInfo = "AccountInfo",
	getReturnPath = function(p1)
		-- upvalues: config (copy), Url (copy)
		local Entry = config[p1]
		
		if Entry then
			local Text: string = Entry()
			local WWWURL = Url.WWW_URL
			
			return if string.sub(Text, 1, #WWWURL) == WWWURL then "/" .. string.sub(Text, #WWWURL + 1) else nil
		else
			return nil
		end
	end,
	PAGES = config,
	toReturnPath = function(Text: string, Segment)
		return if string.sub(Text, 1, #Segment) == Segment then "/" .. string.sub(Text, #Segment + 1) else nil
	end
}