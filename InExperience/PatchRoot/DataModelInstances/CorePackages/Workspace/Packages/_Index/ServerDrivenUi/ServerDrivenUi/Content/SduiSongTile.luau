local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local cryoModule = require(parent.Cryo)
local useSongAlbumArt = require(parent.Songbird).useSongAlbumArt
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local executeAction = sduiCoreSystemModule.executeAction
local sduiTileModule = require(serverDrivenUi.Content.SduiTile)
local sduiTileFooterModule = require(serverDrivenUi.Content.SduiTileFooter)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useSongAlbumArt (ref), reactModule (ref), sduiActionType (ref), executeAction (ref), sduiTileFooterModule (ref), sduiTileModule (ref), cryoModule (ref)
	local songId = p1.songId
	
	return reactModule.createElement(sduiTileModule, cryoModule.Dictionary.join(p1, {
		testId = "--sdui-song-tile",
		image = if p1.image and p1.image ~= "" then p1.image else useSongAlbumArt(songId).value,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref), sduiActionType (copy), songId (ref), executeAction (copy)
			if p1.onActivated then
				p1.onActivated()
				
				return
			end
			executeAction({
				actionType = sduiActionType.OpenSongDetail,
				actionParams = { songId = songId }
			}, p1.analyticsContext, p1.sduiContext)
		end, {
			p1.onActivated,
			p1.sduiContext,
			p1.analyticsContext,
			songId
		}),
		footerComponent = reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), sduiTileFooterModule (copy)
			return if p1.footerComponent then p1.footerComponent else reactModule.createElement(sduiTileFooterModule, {
				testId = "--sdui-song-tile-footer-artist",
				leftText = p1.artistText
			})
		end, { p1.footerComponent, p1.artistText, useTokens() })
	}))
end)