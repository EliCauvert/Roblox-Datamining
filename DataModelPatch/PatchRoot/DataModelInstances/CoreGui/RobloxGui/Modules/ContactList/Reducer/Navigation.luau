local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(script.Parent.Parent.Enums.Pages)

return require(CorePackages.Packages.Rodux).createReducer({ currentPage = nil, currentTag = "" }, {
	[require(script.Parent.Parent.Actions.SetCurrentPage).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			currentPage = if p2.page == nil then CryoModule.None else p2.page
		})
	end,
	[require(script.Parent.Parent.Actions.SetCurrentTag).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { currentTag = p2.tag })
	end
})