<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%book_category}}`.
 */
class m220731_104120_create_book_category_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%book-category}}', [
            'id' => $this->primaryKey(),
            'id_book' => $this->integer()->notNull(),
            'id_category' => $this->integer()->notNull(),
        ]);
        $this->addForeignKey(
            'chain_to_book_cat',
            '{{%book-category}}',
            'id_book',
            'books',
            'id',
            'CASCADE'
        );
        $this->addForeignKey(
            'chain_to_category',
            '{{%book-category}}',
            'id_category',
            'category',
            'id',
            'CASCADE'
        );
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%book_category}}');
    }
}
