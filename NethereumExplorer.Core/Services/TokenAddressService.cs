using System.Collections.Generic;

namespace NethereumExplorer.Services
{
    public class TokenAddressService
    {
        public List<TokenInfo> GetTokens(string chainId)
        {
            //hack / workaround chainId this needs to use the rpc getchainid
            if (chainId.ToLower() == "https://chainnova-scf-chain.darkube.app".ToLower())
            {
                return new List<TokenInfo>(
                    new []
                    {
                        new TokenInfo(){Address = "0x6f52e9595c1e0abafba6743ae8cd2896da32e6d5", Description = "CRT"},

                    }
                );
            }
            return new List<TokenInfo>();
        }
    }
}
