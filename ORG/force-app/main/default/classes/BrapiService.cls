public with sharing class BrapiService {
    
    public class Quote {
        public String symbol;
        public String logourl;
        public Decimal regularMarketPrice;
        public Decimal regularMarketDayHigh;
        public Decimal regularMarketDayLow;
        public Decimal regularMarketChangePercent;
    }
    public class QuoteResponse {
        public List<Quote> results;
    }

    @TestVisible static String TEST_BASE_URL; // para testes
    @TestVisible static String TEST_TOKEN;    // para testes

    private static String baseUrl() {
        return (TEST_BASE_URL != null) ? TEST_BASE_URL : 'callout:Brapi';
    }

    private static String token() {
        if (TEST_TOKEN != null) return TEST_TOKEN;
        Brapi_Settings__mdt cfg = Brapi_Settings__mdt.getInstance('brapiToken');
        if (cfg == null || String.isBlank(cfg.Token__c)) {
            throw new AuraHandledException('Token do Brapi não configurado (Brapi_Settings__mdt.brapiToken.Token__c).');
        }
        return cfg.Token__c;
    }




    
}