
local lx, _M = oo{
    _cls_ = '',
    _ext_ = 'box'
}

local app, lf, tb, str = lx.kit()

function _M:reg()

    app:bindFrom('lxlib.ext.dom', {
        'domNode', 'domDocument', 'domElement'
    })
end

function _M:boot()

end

return _M
